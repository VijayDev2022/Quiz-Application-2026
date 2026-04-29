import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function UserDashboard() {
  const [users, setUsers] = useState([]);
  const [form, setForm] = useState({ id: null, name: "", email: "", password: "" });
  const [editing, setEditing] = useState(false);

  // Load users
  const loadUsers = async () => {
    const res = await api.get("/users");
    setUsers(res.data);
  };

  useEffect(() => {
    loadUsers();
  }, []);

  // Handle form submit
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (editing) {
      await api.put(`/users/${form.id}`, form);
    } else {
      await api.post("/users", form);
    }
    setForm({ id: null, name: "", email: "", password: "" });
    setEditing(false);
    loadUsers();
  };

  // Edit user
  const handleEdit = (user) => {
    setForm({ id: user.id, name: user.name, email: user.email, password: "" });
    setEditing(true);
  };

  // Delete user
  const handleDelete = async (id) => {
    if (window.confirm("Are you sure?")) {
      await api.delete(`/users/${id}`);
      loadUsers();
    }
  };

  return (
    <AdminLayout>
      <div className="container mt-4">
        <h2>User Management</h2>

        {/* User Form */}
        <form onSubmit={handleSubmit} className="mb-4">
          <div className="mb-2">
            <input
              type="text"
              placeholder="Name"
              className="form-control"
              value={form.name}
              onChange={(e) => setForm({ ...form, name: e.target.value })}
              required
            />
          </div>
          <div className="mb-2">
            <input
              type="email"
              placeholder="Email"
              className="form-control"
              value={form.email}
              onChange={(e) => setForm({ ...form, email: e.target.value })}
              required
            />
          </div>
          <div className="mb-2">
            <input
              type="password"
              placeholder="Password"
              className="form-control"
              value={form.password}
              onChange={(e) => setForm({ ...form, password: e.target.value })}
              {...(editing ? {} : { required: true })}
            />
          </div>
          <button className="btn btn-primary">{editing ? "Update User" : "Create User"}</button>
          {editing && (
            <button
              type="button"
              className="btn btn-secondary ms-2"
              onClick={() => { setForm({ id: null, name: "", email: "", password: "" }); setEditing(false); }}
            >
              Cancel
            </button>
          )}
        </form>

        {/* User Table */}
        <table className="table table-bordered table-striped">
          <thead className="table-dark">
            <tr>
              <th>ID</th>
              <th>Name</th>
              <th>Email</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            {users.length > 0 ? users.map((u) => (
              <tr key={u.id}>
                <td>{u.id}</td>
                <td>{u.name}</td>
                <td>{u.email}</td>
                <td>
                  <button className="btn btn-sm btn-warning me-2" onClick={() => handleEdit(u)}>Edit</button>
                  <button className="btn btn-sm btn-danger" onClick={() => handleDelete(u.id)}>Delete</button>
                </td>
              </tr>
            )) : (
              <tr>
                <td colSpan="4" className="text-center">No users found</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </AdminLayout>
  );
}

export default UserDashboard;