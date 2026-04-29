import axios from "axios";
import { logoutUser,checkAuth } from "./auth";

const api = axios.create({
  baseURL: "http://localhost/quiz/public/index.php/api/",
});

// attach token
api.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");

  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }

  return config;
});

// auto logout on 401
api.interceptors.response.use(
  (res) => res,
  (err) => {
    if (err.response?.status === 401) {
      logoutUser();
    }
    return Promise.reject(err);
  }
);

export default api;