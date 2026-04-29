import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function CreateQuiz() {
  const navigate = useNavigate();

  const [form, setForm] = useState({
    name: "",
    time_limit: 10,
    category_id: "",
    type: "easy",
    status: 1,
  });

  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(false);

  // Fetch categories
  useEffect(() => {
    api.get("/categories")
      .then((res) => setCategories(res.data))
      .catch((err) => console.error(err));
  }, []);

  // Handle input change
  const handleChange = (e) => {
    const { name, value } = e.target;

    setForm({
      ...form,
      [name]: name === "status" ? Number(value) : value,
    });
  };

  // Submit form
  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);

    try {
      await api.post("/quizzes", form);

      alert("Quiz created successfully");
      navigate("/quiz");
    } catch (error) {
      console.error("Create quiz error:", error);
    } finally {
      setLoading(false);
    }
  };

  return (
    <AdminLayout>
      <div className="container mt-4">
        <h4>Create Quiz</h4>

        <form onSubmit={handleSubmit}>
          {/* Name */}
          <input
            type="text"
            name="name"
            className="form-control mb-2"
            placeholder="Quiz Name"
            value={form.name}
            onChange={handleChange}
            required
          />

          {/* Time Limit */}
          <input
            type="number"
            name="time_limit"
            className="form-control mb-2"
            placeholder="Time Limit (minutes)"
            value={form.time_limit}
            onChange={handleChange}
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
            <button type="submit" className="btn btn-success" disabled={loading}>
              {loading ? "Creating..." : "Create"}
            </button>

            <button
              type="button"
              className="btn btn-secondary"
              onClick={() => navigate("/quizzes")}
            >
              Back
            </button>
          </div>
        </form>
      </div>
    </AdminLayout>
  );
}

export default CreateQuiz;