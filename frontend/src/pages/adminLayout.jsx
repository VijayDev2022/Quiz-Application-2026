import { useNavigate } from "react-router-dom";
import { useState } from "react";
import Topbar from "./admin_top_bar";

function AdminLayout({ children }) {
  const navigate = useNavigate();
  const [collapsed, setCollapsed] = useState(false);

  const logout = () => {
    localStorage.removeItem("token");
    navigate("/");
  };

  return (
    <div className="d-flex">

      {/* Sidebar */}
      <div
        className="bg-dark text-white p-3"
        style={{
          width: collapsed ? "70px" : "220px",
          minHeight: "100vh",
          transition: "0.3s"
        }}
      >
        <h4 className="text-center mb-4">
          {collapsed ? " " : "Quiz App"}
        </h4>

        <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/dashboard")}
        >
          {collapsed ? "D" : "Dashboard"}
        </button>
        

        <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/questions")}
        >
          {collapsed ? "+" : "Questions"}
        </button>
         <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/categories")}
        >
          {collapsed ? "+" : "Categories"}
        </button>

        <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/quiz")}
        >
          {collapsed ? "+" : "Quiz"}
        </button>

        <button
          className="btn btn-danger w-100 mt-4"
          onClick={logout}
        >
          {collapsed ? "X" : "Logout"}
        </button>
      </div>

      {/* Main Area */}
      <div className="flex-grow-1">

        {/* Topbar with toggle button */}
        <Topbar onToggle={() => setCollapsed(!collapsed)} />

        {/* Page Content */}
        <div className="p-4">
          {children}
        </div>

      </div>

    </div>
  );
}

export default AdminLayout;