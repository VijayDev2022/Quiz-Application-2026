import { Navigate } from "react-router-dom";

const ProtectedRoute = ({ children, allowedRole }) => {
  const token = localStorage.getItem("token");
  const role = localStorage.getItem("role");

  // Not logged in
  if (!token) {
    return <Navigate to="/" replace />;
  }

  // Role restriction
  if (allowedRole && role !== allowedRole) {
    return (
      <Navigate
        to={role === "user" ? "/quiz-user/" : "/dashboard"}
        replace
      />
    );
  }

  return children;
};

export default ProtectedRoute;