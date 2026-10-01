import Jobs from "./Jobs";
import "./Home.css";

function Home() {
  return (
    <div className="bg-light p-5 rounded shadow mb-5 text-center">
  <h1 className="fw-bold display-5">
    Find Your Dream Job 
  </h1>

  <p className="text-muted fs-5">
    Top companies are hiring now
  </p>


      <Jobs />

    </div>
  );
}

export default Home;