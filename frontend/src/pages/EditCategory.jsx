import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function EditCategory() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [form, setForm] = useState({
    name: "",
   
    status: 1,
  });

  useEffect(() => {
    fetchQuestion();
  }, []);

  const fetchQuestion = async () => {
    const res = await api.get(`/categories/${id}`);
    setForm(res.data);
  };

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      await api.put(`/categories/${id}`, form);
      alert("Updated successfully");
      //navigate("/");
      window.location.reload();
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <AdminLayout>
    <div className="container mt-4">
      <h4>Edit Category</h4>

      <form onSubmit={handleSubmit}>
        <input
          className="form-control mb-2"
          name="name"
          value={form.name}
          onChange={handleChange}
        />
        

        

        <select className="form-control mb-2" name="status" value={form.status} onChange={handleChange}>
          <option value={1}>Active</option>
          <option value={0}>Inactive</option>
        </select>

        <button className="btn btn-success">Update</button>

         &nbsp;
        <button
  type="button"
  className="btn btn-secondary"
  onClick={() => navigate("/categories")}
>
  Back
</button>
      </form>
    </div>
    </AdminLayout>
  );
}

export default EditCategory;