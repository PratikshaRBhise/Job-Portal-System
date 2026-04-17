import { useEffect, useState } from "react";
import API from "../context/api";
import { Link } from "react-router-dom";
import "./Jobs.css";

function Jobs() {

  const [jobs, setJobs] = useState([]);
  const [search, setSearch] = useState("");

  useEffect(() => {
    API.get("/api/jobs/all")
      .then((res) => setJobs(res.data))
      .catch((err) => console.log(err));
  }, []);

  const filteredJobs = jobs.filter((job) =>
    job.title.toLowerCase().includes(search.toLowerCase()) ||
    job.location.toLowerCase().includes(search.toLowerCase())
  );

  return (
    <div className="container mt-4">

      {/* Title */}
      <h2 className="text-center fw-bold mb-4">
        Available Jobs
      </h2>

      {/* Search */}
      <input
        type="text"
        placeholder="Search by title or location..."
        className="form-control mb-4 shadow-sm"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />

      <div className="row">

        {filteredJobs.length === 0 && (
          <p className="text-center text-muted">No jobs found</p>
        )}

        {filteredJobs.map((job) => (
          <div key={job.jobId} className="col-md-6 col-lg-4 mb-4">

            <div className="card job-card h-100 border-0 shadow-lg">

              <div className="card-body d-flex flex-column">

                {/* Job Title */}
                <h5 className="fw-bold text-primary">
                  {job.title}
                </h5>

                {/* Company (optional) */}
               {job.company && (
  <p className="mb-1 fw-semibold">
     {job.company.companyName}
  </p>
)}

                {/* Location */}
                <p className="text-muted mb-2">
                  📍 {job.location}
                </p>

                {/* Description */}
                <p className="small text-secondary flex-grow-1">
                  {job.description.length > 100
                    ? job.description.substring(0, 100) + "..."
                    : job.description}
                </p>

                {/* Salary (optional) */}
                {job.salary && (
                  <p className="fw-semibold text-success mb-2">
                    💰 {job.salary}
                  </p>
                )}

                {/* Tags */}
                <div className="d-flex flex-wrap gap-2 mb-3">
                  <span className="badge bg-success">Full Time</span>
                  <span className="badge bg-info text-dark">Immediate</span>
                </div>

                {/* Button */}
                <Link to={`/apply/${job.jobId}`}>
                  <button className="btn btn-warning w-100 fw-bold">
                    Apply Now
                  </button>
                </Link>

              </div>

            </div>

          </div>
        ))}

      </div>
    </div>
  );
}

export default Jobs;