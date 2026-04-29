import { useState } from "react";
import { useNavigate } from "react-router-dom";

import api from "../api";
import { setToken,setRole, isLoggedIn } from "../auth";


function Login() {
  console.log(localStorage.getItem("role"));
  const navigate = useNavigate();

  //   if(localStorage.getItem("role") == "user"){
  //     window.location.href = "/quiz-user/";
  //   } else if(localStorage.getItem("role") == "admin") {
  //     window.location.href = "/dashboard";
  // } else {
  //     window.location.href = "/login";
  // }
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const login = async (e) => {
    e.preventDefault();
    //const res = await api.post("/login", { email, password });
    try {
    const res = await api.post("/login", { email, password });

      setToken(res.data.token);
      setRole(res.data.role);
      localStorage.setItem("user_id", res.data.user_id);
      localStorage.setItem("user_name", res.data.user_name);
  

    if(localStorage.getItem("role") == "user" || res.data.role == "user"){
      window.location.href = "/quiz-user/";
    } else {
      window.location.href = "/dashboard";
  }
    
      //window.location.href = "/dashboard";
    } catch (err) {
      alert("Login failed");
    }
  };

  return (
    <div className="container">
      <div className="row justify-content-center align-items-center vh-100">

        <div className="col-md-4">

          <div className="card shadow-lg border-0">
            
            <div className="card-header bg-primary text-white text-center">
              <h4 className="mb-0">Login</h4>
            </div>

            <div className="card-body p-4">

              <form onSubmit={login}>

                {/* Email */}
                <div className="mb-3">
                  <label className="form-label">Email</label>
                  <input
                    type="email"
                    className="form-control"
                    placeholder="Enter email"
                    onChange={(e) => setEmail(e.target.value)}
                  />
                </div>

                {/* Password */}
                <div className="mb-3">
                  <label className="form-label">Password</label>
                  <input
                    type="password"
                    className="form-control"
                    placeholder="Enter password"
                    onChange={(e) => setPassword(e.target.value)}
                  />
                </div>

                {/* Button */}
                <button type="submit" className="btn btn-primary w-100">
                  Login
                </button>

              </form>

            </div>

          </div>

        </div>

      </div>
    </div>
  );
}

export default Login;