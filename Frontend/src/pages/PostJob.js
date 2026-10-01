import { useState, useEffect } from "react";
import api from "../context/api";
import "./PostJob.css";

function PostJob() {

  const emptyJob = {
    title: "",
    description: "",
    salary: "",
    location: ""
  };

  const [job, setJob] = useState(emptyJob);
  const [jobs, setJobs] = useState([]);
  const [search, setSearch] = useState("");
  const [editId, setEditId] = useState(null);
  const [showForm, setShowForm] = useState(false);

  // ✅ FETCH JOBS
  const fetchJobs = () => {
    api.get("/api/jobs/all")
      .then((res) => setJobs(res.data))
      .catch((err) => console.log(err));
  };

  useEffect(() => {
    fetchJobs();
  }, []);

  // ✅ HANDLE INPUT
  const handleChange = (e) => {
    setJob({ ...job, [e.target.name]: e.target.value });
  };

  // ✅ RESET FORM
  const resetForm = () => {
    setEditId(null);
    setShowForm(false);
    setJob(emptyJob);
  };

  // ✅ POST / UPDATE
  const handleSubmit = (e) => {
    e.preventDefault();

    if (editId) {
      api.put(`/api/jobs/update/${editId}`, job)
        .then(() => {
          alert("Job Updated Successfully");
          resetForm();
          fetchJobs();
        })
        .catch(() => alert("Update Failed"));
    } else {
      api.post("/api/jobs/post", job)
        .then(() => {
          alert("Job Posted Successfully");
          resetForm();
          fetchJobs();
        })
        .catch(() => alert("Post Failed"));
    }
  };

  // ✅ DELETE WITH CONFIRMATION
  const handleDelete = (id) => {

    const confirmDelete = window.confirm("⚠️ Are you sure you want to delete this job?");

    if (!confirmDelete) return;

    api.delete(`/api/jobs/delete/${id}`)
      .then(() => {
        alert("Job Deleted Successfully");
        fetchJobs();
      })
      .catch(() => alert("Delete Failed"));
  };

  // ✅ EDIT
  const handleEdit = (j) => {
    setEditId(j.jobId);
    setJob({
      title: j.title || "",
      description: j.description || "",
      salary: j.salary || "",
      location: j.location || ""
    });
    setShowForm(true);
  };

  // ✅ ADD NEW
  const handleAddNew = () => {
    setEditId(null);
    setJob(emptyJob);
    setShowForm(true);
  };

  // ✅ SEARCH FILTER
  const filteredJobs = jobs.filter((j) =>
    (j.title?.toLowerCase() || "").includes(search.toLowerCase()) ||
    (j.location?.toLowerCase() || "").includes(search.toLowerCase())
  );

  return (
    <div className="container mt-5">

      <h3 className="text-center fw-bold mb-4">
        Job Management (Recruiter)
      </h3>

      {/* 🔍 SEARCH */}
      <input
        type="text"
        placeholder="Search by title or location..."
        className="form-control mb-3"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      {/* ➕ ADD BUTTON */}
      <button
        className="btn btn-primary mb-4"
        onClick={handleAddNew}
      >
        + Add New Job
      </button>

      {/* 📝 FORM */}
      {showForm && (
        <div className="card p-4 mb-4 shadow">

          <h5 className="text-center mb-3">
            {editId ? "Edit Job" : "Add New Job"}
          </h5>

          <form onSubmit={handleSubmit}>

            <input
              type="text"
              name="title"
              placeholder="Job Title"
              className="form-control mb-2"
              value={job.title}
              onChange={handleChange}
              required
            />

            <textarea
              name="description"
              placeholder="Description"
              className="form-control mb-2"
              value={job.description}
              onChange={handleChange}
              required
            />

            <input
              type="text"
              name="salary"
              placeholder="Salary"
              className="form-control mb-2"
              value={job.salary}
              onChange={handleChange}
            />

            <input
              type="text"
              name="location"
              placeholder="Location"
              className="form-control mb-3"
              value={job.location}
              onChange={handleChange}
              required
            />

            <button className="btn btn-success w-100">
              {editId ? "Update Job" : "Post Job"}
            </button>

            {/* ❌ CANCEL */}
            <button
              type="button"
              className="btn btn-secondary w-100 mt-2"
              onClick={resetForm}
            >
              Cancel
            </button>

          </form>

        </div>
      )}

      {/* 📋 JOB LIST */}
      <div className="row">

        {filteredJobs.length === 0 && (
          <p className="text-center">No Jobs Found</p>
        )}

        {filteredJobs.map((j) => (
          <div key={j.jobId} className="col-md-4 mb-4">

            <div className="card p-3 shadow">

              <h5 className="text-primary">{j.title}</h5>

              <p>{j.description}</p>

              <p><b>📍 {j.location}</b></p>

              <p>💰 {j.salary}</p>

              <div className="d-flex gap-2">

                <button
                  className="btn btn-warning w-50"
                  onClick={() => handleEdit(j)}
                >
                  Edit
                </button>

                <button
                  className="btn btn-danger w-50"
                  onClick={() => handleDelete(j.jobId)}
                >
                  Delete
                </button>

              </div>

            </div>

          </div>
        ))}

      </div>

    </div>
  );
}

export default PostJob;