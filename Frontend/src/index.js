import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";

// Bootstrap
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";

import { createBrowserRouter, RouterProvider } from "react-router-dom";

import Navbar from "./component/Navbar";

// Pages
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import PostJob from "./pages/PostJob";
import ApplyJob from "./pages/ApplyJob";
import ForgotPassword from "./pages/ForgotPassword";

// ✅ Router Configuration
const router = createBrowserRouter([
  {
    path: "/",
    element: <Navbar />,
    children: [
      { index: true, element: <Home /> },
      { path: "home", element: <Home /> },
      { path: "login", element: <Login /> },
      { path: "register", element: <Register /> },
      { path: "post-job", element: <PostJob /> },
      { path: "apply/:jobId", element: <ApplyJob /> },

      // ✅ FIXED LINE
      { path: "forgot-password", element: <ForgotPassword /> },
    ],
  },
]);

const root = ReactDOM.createRoot(
  document.getElementById("root")
);

root.render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);