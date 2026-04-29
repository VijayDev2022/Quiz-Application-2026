import { useNavigate } from "react-router-dom";
import { useState, useEffect } from "react";
import Topbar from "./admin_top_bar";

function AdminLayout({ children }) {
  const navigate = useNavigate();
  const [collapsed, setCollapsed] = useState(false);
  const [userName, setUserName] = useState("");

  const logout = () => {
    localStorage.removeItem("token");
    navigate("/");
  };

  useEffect(() => {
  const name = localStorage.getItem("user_name");
  if (name) setUserName(name);
}, []);

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
          {collapsed ? " " : userName || "User"}
        </h4>

        <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/quiz-user")}
        >
          {collapsed ? "D" : "Dashboard"}
        </button>

        <button
          className="btn btn-outline-light w-100 mb-2"
          onClick={() => navigate("/quiz-user/list")}
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