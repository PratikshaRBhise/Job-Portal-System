import { useState } from "react";
import axios from "axios";

function ForgotPassword() {

  const [email, setEmail] = useState("");

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      await axios.post("http://localhost:8081/api/users/forgot-password", { email });
      alert("Reset link sent to your email");
    } catch (err) {
      alert("Error sending reset link");
    }
  };

  return (
    <div className="container mt-5">

      <div className="row justify-content-center">

        <div className="col-md-4">

          <div className="card p-4 shadow">

            <h4 className="text-center mb-3">Forgot Password</h4>

            <form onSubmit={handleSubmit}>
              <input
                type="email"
                className="form-control mb-3"
                placeholder="Enter your email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />

              <button className="btn btn-primary w-100">
                Send Reset Link
              </button>
            </form>

          </div>

        </div>

      </div>

    </div>
  );
}

export default ForgotPassword;