import { useState } from "react";
import { useParams } from "react-router-dom"; 
import api from "../context/api";
import "./ApplyJob.css";

function ApplyJob() {

  const { jobId } = useParams(); // ⭐ Dynamic Job ID from URL

  const [resume, setResume] = useState(null);
  const [previewUrl, setPreviewUrl] = useState(null);
  const [email, setEmail] = useState("");
  const [otp, setOtp] = useState("");

  // FILE CHANGE + PREVIEW
  const handleFileChange = (e) => {
    const file = e.target.files[0];

    if (file && file.type === "application/pdf") {
      setResume(file);
      setPreviewUrl(URL.createObjectURL(file));
    } else {
      alert("Please select a PDF file");
      setResume(null);
      setPreviewUrl(null);
    }
  };

  // SEND OTP
  const handleSendOtp = async () => {
    if (!email) {
      alert("Please enter email first");
      return;
    }

    try {
      await api.post(`/otp/send?email=${email}`);
      alert("OTP sent to your email");
    } catch (err) {
      alert("Failed to send OTP");
    }
  };

  // SUBMIT APPLICATION
  const handleSubmit = async (e) => {
    e.preventDefault();

    const userId = sessionStorage.getItem("userId");

    if (!userId) {
      alert("User not logged in");
      return;
    }

    if (!resume) {
      alert("Please upload resume");
      return;
    }

    try {
      // ⭐ VERIFY OTP
      const verify = await api.post(
        `/otp/verify?email=${email}&otp=${otp.trim()}`
      );

      if (verify.data !== "OTP Verified") {
        alert("Invalid OTP");
        return;
      }

      // ⭐ SEND DATA
      const formData = new FormData();
      formData.append("userId", userId);
      formData.append("jobId", jobId); 
      formData.append("resume", resume);

      await api.post("/api/applications/apply", formData);

      alert("Application Submitted Successfully 🎉");

      // Reset
      setResume(null);
      setPreviewUrl(null);
      setEmail("");
      setOtp("");

    } catch (err) {
      console.log(err);
      alert("Submission Failed ❌");
    }
  };

  return (
    <div className="container mt-5">

      <div className="row justify-content-center">

        <div className="col-md-6 col-lg-5">

          <div className="card shadow border-0">

            <div className="card-body p-4">

              <h3 className="text-center fw-bold mb-4">
                Apply for Job
              </h3>

              <form onSubmit={handleSubmit}>

                {/* EMAIL */}
                <div className="mb-3">
                  <label className="form-label fw-semibold">Email</label>
                  <input
                    type="email"
                    className="form-control"
                    placeholder="Enter your email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    required
                  />
                </div>

                {/* SEND OTP */}
                <button
                  type="button"
                  onClick={handleSendOtp}
                  className="btn btn-primary w-100 mb-3"
                >
                  Send OTP
                </button>

                {/* OTP */}
                <div className="mb-3">
                  <label className="form-label fw-semibold">Enter OTP</label>
                  <input
                    type="text"
                    className="form-control"
                    placeholder="Enter OTP"
                    value={otp}
                    onChange={(e) => setOtp(e.target.value)}
                    required
                  />
                </div>

                {/* FILE INPUT */}
                <div className="mb-3">
                  <label className="form-label fw-semibold">
                    Upload Resume (PDF)
                  </label>

                  <input
                    type="file"
                    className="form-control"
                    accept=".pdf"
                    onChange={handleFileChange}
                    required
                  />
                </div>

                {/* FILE NAME */}
                {resume && (
                  <p className="small text-success">
                    Selected file: {resume.name}
                  </p>
                )}

                {/* OPEN IN NEW TAB */}
                {previewUrl && (
                  <a
                    href={previewUrl}
                    target="_blank"
                    rel="noreferrer"
                    className="btn btn-outline-secondary w-100 mb-3"
                  >
                    Open PDF in New Tab
                  </a>
                )}

                {/* PDF PREVIEW */}
                {previewUrl && (
                  <iframe
                    src={previewUrl}
                    width="100%"
                    height="400px"
                    title="PDF Preview"
                    style={{ border: "1px solid #ccc", marginBottom: "15px" }}
                  ></iframe>
                )}

                <p className="text-muted small mb-4">
                  Please upload your latest resume in PDF format.
                </p>

                {/* SUBMIT */}
                <button className="btn btn-success w-100 fw-bold">
                  Submit Application
                </button>

              </form>

            </div>

          </div>

        </div>

      </div>

    </div>
  );
}

export default ApplyJob;