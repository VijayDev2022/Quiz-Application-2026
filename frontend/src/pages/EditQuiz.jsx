import { useEffect, useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function EditQuiz() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [form, setForm] = useState({
    name: "",
    time_limit: 10,
    category_id: "",
    type: "easy",
    status: 1,
  });

  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);

  // Fetch categories + quiz data
  useEffect(() => {
    fetchCategories();
    fetchQuiz();
  }, []);

  const fetchCategories = async () => {
    try {
      const res = await api.get("/categories");
      setCategories(res.data);
    } catch (err) {
      console.error(err);
    }
  };

  const fetchQuiz = async () => {
    try {
      const res = await api.get(`/quizzes/${id}`);

      setForm({
        name: res.data.name || "",
        time_limit: res.data.time_limit || 10,
        category_id: res.data.category_id || "",
        type: res.data.type || "easy",
        status: res.data.status ?? 1,
      });
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  // Handle input
  const handleChange = (e) => {
    const { name, value } = e.target;

    setForm({
      ...form,
      [name]: name === "status" ? Number(value) : value,
    });
  };

  // Submit update
  const handleSubmit = async (e) => {
    e.preventDefault();
    setSaving(true);

    try {
      await api.put(`/quizzes/${id}`, form);

      alert("Quiz updated successfully");
      navigate("/quiz");
    } catch (err) {
      console.error("Update error:", err);
    } finally {
      setSaving(false);
    }
  };

  return (
    <AdminLayout>
      <div className="container mt-4">
        <h4>Edit Quiz</h4>

        {loading ? (
          <p>Loading...</p>
        ) : (
          <form onSubmit={handleSubmit}>
            {/* Name */}
            <input
              type="text"
              name="name"
              className="form-control mb-2"
              value={form.name}
              onChange={handleChange}
              placeholder="Quiz Name"
              required
            />

            {/* Time Limit */}
            <input
              type="number"
              name="time_limit"
              className="form-control mb-2"
              value={form.time_limit}
              onChange={handleChange}
              placeholder="Time Limit"
            />

            {/* Category */}
            <select
              name="category_id"
              className="form-control mb-2"
              value={form.category_id}
              onChange={handleChange}
            >
              <option value="">Select Category</option>

              {categories.map((cat) => (
                <option key={cat.id} value={cat.id}>
                  {cat.name}
                </option>
              ))}
            </select>

            {/* Type */}
            <select
              name="type"
              className="form-control mb-2"
              value={form.type}
              onChange={handleChange}
            >
              <option value="easy">Easy</option>
              <option value="medium">Medium</option>
              <option value="difficult">Difficult</option>
            </select>

            {/* Status */}
            <select
              name="status"
              className="form-control mb-2"
              value={form.status}
              onChange={handleChange}
            >
              <option value={1}>Active</option>
              <option value={0}>Inactive</option>
            </select>

            {/* Buttons */}
            <div className="d-flex gap-2 mt-3">
              <button
                type="submit"
                className="btn btn-success"
                disabled={saving}
              >
                {saving ? "Updating..." : "Update"}
              </button>

              <button
                type="button"
                className="btn btn-secondary"
                onClick={() => navigate("/quiz")}
              >
                Back
              </button>
            </div>
          </form>
        )}
      </div>
    </AdminLayout>
  );
}

export default EditQuiz;