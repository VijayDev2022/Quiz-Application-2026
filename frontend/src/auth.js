export const getToken = () => localStorage.getItem("token");


export const isLoggedIn = () => !!getToken();

export const setToken = (token) => {
  localStorage.setItem("token", token);
 
};

export const setRole = (role) => {
  localStorage.setItem("role", role);
 
};

export const logoutUser = () => {
  localStorage.removeItem("token");
  window.location.href = "/"; // redirect to login
};

export const checkAuth = () => {
  const token = localStorage.getItem("token");

  if (!token) {
    window.location.href = "/";
    return false;
  }

  return true;
};