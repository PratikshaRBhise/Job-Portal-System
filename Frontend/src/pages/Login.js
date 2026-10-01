import { useState } from "react";
import { useNavigate, Link } from "react-router-dom";
import axios from "axios";

function Login() {

  const navigate = useNavigate();

  const [formdata, setFormdata] = useState({
    email: "",
    password: ""
  });

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const res = await axios.post(
        "http://localhost:8081/api/users/login",
        formdata
      );
      
      const user = res.data;

      // ✅ Save user data
      sessionStorage.setItem("userId", user.id);
      sessionStorage.setItem("role", user.role);
      sessionStorage.setItem("name", user.name);

      alert("Login Successful");
      navigate("/");

    } catch (err) {
      alert("Invalid email or password");
      console.log(err);
    }
  };

  const handleChange = (e) => {
    setFormdata({
      ...formdata,
      [e.target.name]: e.target.value
    });
  };

  return (
    <div className="container mt-5">

      <div className="row justify-content-center">

        <div className="col-md-5 col-lg-4">

          <div className="card shadow border-0">

            <div className="card-body p-4">

              <h3 className="text-center fw-bold mb-4">
                Welcome Back
              </h3>

              <form onSubmit={handleSubmit}>

                {/* EMAIL */}
                <div className="mb-3">
                  <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    className="form-control"
                    value={formdata.email}
                    onChange={handleChange}
                    required
                  />
                </div>

                {/* PASSWORD */}
                <div className="mb-2">
                  <input
                    type="password"
                    name="password"
                    placeholder="Password"
                    className="form-control"
                    value={formdata.password}
                    onChange={handleChange}
                    required
                  />
                </div>

                {/* 🔑 FORGOT PASSWORD */}
                <div className="text-end mb-3">
                  <Link to="/forgot-password" style={{ fontSize: "14px" }}>
                    Forgot Password?
                  </Link>
                </div>

                {/* LOGIN BUTTON */}
                <button className="btn btn-primary w-100 fw-bold">
                  Login
                </button>

              </form>

              {/* REGISTER */}
              <p className="text-center mt-3">
                Don’t have an account?{" "}
                <Link to="/register">Register</Link>
              </p>

            </div>

          </div>

        </div>

      </div>

    </div>
  );
}

export default Login;