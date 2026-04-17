import { Link } from "react-router-dom";

function Sidebar() {
  return (
    <div className="sidebar">

      <h4>💼 Dashboard</h4>

      <Link to="/"> Home</Link>
      <Link to="/post-job"> Post Job</Link>
      <Link to="/applications"> My Applications</Link>
      <Link to="/login"> Logout</Link>

    </div>
  );
}

export default Sidebar;