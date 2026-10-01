import { Link, Outlet, useNavigate } from "react-router-dom";
import "./Navbar.css";

function Navbar() {
  const navigate = useNavigate();
  const role = sessionStorage.getItem("role");

  const handleLogout = () => {
    localStorage.removeItem("jwt");
    sessionStorage.clear();
    navigate("/login");
  };

  return (
    <>
      <nav className="navbar">

        {/* LEFT: Project Name */}
        <Link to="/" className="navbar-left">
          JobPortalSystem
        </Link>

        {/* CENTER: Menu Links */}
        <div className="navbar-center">
          <Link to="/">Home</Link>
          {!role && <Link to="/login">Login</Link>}
          {!role && <Link to="/register">Register</Link>}
          {(role === "ADMIN" || role === "RECRUITER") && <Link to="/post-job">Post Job</Link>}
        </div>

        {/* RIGHT: Logout Button */}
        {role && (
          <div className="navbar-right">
            <button onClick={handleLogout}>Logout</button>
          </div>
        )}
      </nav>

      <main>
        <Outlet />
      </main>
    </>
  );
}

export default Navbar;