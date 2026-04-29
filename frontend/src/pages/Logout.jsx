import { useState } from "react";
import api from "../api";
import { useNavigate } from "react-router-dom";


function Logout() {
const navigate = useNavigate();

//   const logout = async () => {
//   await api.post("/logout");
//   localStorage.removeItem("token");
//   navigate("/");
// };
api.post("/logout");
  localStorage.removeItem("token");
  navigate("/");

}

export default Logout;