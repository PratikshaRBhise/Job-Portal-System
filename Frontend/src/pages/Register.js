import { useState } from "react";
import API from "../context/api";

function Register() {

  const [user, setUser] = useState({
    name: "",
    email: "",
    password: "",
    phone: "",
    role: ""   // ✅ Added role
  });

  const handleChange = (e) => {
    setUser({ ...user, [e.target.name]: e.target.value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    API.post("/api/users/register", user)
      .then(() => {
        alert("Registered Successfully");
        // optional: reset form
        setUser({
          name: "",
          email: "",
          password: "",
          phone: "",
          role: ""
        });
      })
      .catch(() => alert("Registration Failed"));
  };

  return (
    <div className="container mt-5">
      <div className="row justify-content-center">
        <div className="col-md-6">

          <div className="card shadow border-0">
            <div className="card-body p-4">

              <h3 className="text-center fw-bold mb-4">
                Create Account
              </h3>

              <form onSubmit={handleSubmit}>

                {/* Name */}
                <div className="mb-3">
                  <input
                    type="text"
                    name="name"
                    placeholder="Full Name"
                    className="form-control"
                    value={user.name}
                    onChange={handleChange}
                    required
                  />
                </div>

                {/* Email */}
                <div className="mb-3">
                  <input
                    type="email"
                    name="email"
                    placeholder="Email Address"
                    className="form-control"
                    value={user.email}
                    onChange={handleChange}
                    required
                  />
                </div>

                {/* Password */}
                <div className="mb-3">
                  <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    className="form-control"
                    value={user.password}
                    onChange={handleChange}
                    required
                  />
                </div>

                {/* Phone */}
                <div className="mb-3">
                  <input
                    type="text"
                    name="phone"
                    placeholder="Phone Number"
                    className="form-control"
                    value={user.phone}
                    onChange={handleChange}
                  />
                </div>

                {/* ✅ Role Dropdown */}
                <div className="mb-3">
                  <select
                    name="role"
                    className="form-control"
                    value={user.role}
                    onChange={handleChange}
                    required
                  >
                    <option value="">Select Role</option>
                    <option value="JOBSEEKER">Job Seeker</option>
                    <option value="RECRUITER">Recruiter</option>
                    {/* ❌ Don't expose ADMIN in UI */}
                  </select>
                </div>

                {/* Button */}
                <button className="btn btn-warning w-100 fw-bold">
                  Register
                </button>

              </form>

            </div>
          </div>

        </div>
      </div>
    </div>
  );
}

export default Register;