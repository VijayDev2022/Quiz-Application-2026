import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function EditQuestion() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [form, setForm] = useState({
    question: "",
    option_a: "",
    option_b: "",
    option_c: "",
    option_d: "",
    correct_answer: "A",
    marks: 1,
    status: 1,
  });

  useEffect(() => {
    fetchQuestion();
  }, []);

  const fetchQuestion = async () => {
    const res = await api.get(`/questions/show/${id}`);
    setForm(res.data);
  };

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      await api.put(`/questions/${id}`, form);
      alert("Updated successfully");
      //navigate("/");
      window.location.reload();
    } catch (err) {
      console.error(err);
    }
  };

  const [categories, setCategories] = useState([]);
  useEffect(() => {
  api.get("/categories").then((res) => {
     setCategories(res.data);
  });
}, []);

  return (
    <AdminLayout>
    <div className="container mt-4">
      <h4>Edit Question</h4>

      <form onSubmit={handleSubmit}>
        <label>Question</label>
        <input
          className="form-control mb-2"
          name="question"
          value={form.question}
          onChange={handleChange}
        />

 <label>Category</label>
 <select
  className="form-control mb-2"
  name="category_id"
  value={form.category_id || ""}
  onChange={handleChange}
>
  <option value="">Select Category</option>

  {categories.map((cat) => (
    <option key={cat.id} value={cat.id}>  
      {cat.name}
    </option>
  ))}
</select>
 <label>Option A</label>

        <input className="form-control mb-2" name="option_a" value={form.option_a} onChange={handleChange} />
        <label>Option B</label>
        <input className="form-control mb-2" name="option_b" value={form.option_b} onChange={handleChange} />
        <label>Option C</label>
        <input className="form-control mb-2" name="option_c" value={form.option_c} onChange={handleChange} />
        <label>Option D</label>
        <input className="form-control mb-2" name="option_d" value={form.option_d} onChange={handleChange} />
<label>Correct Answer</label>
        <select className="form-control mb-2" name="correct_answer" value={form.correct_answer} onChange={handleChange}>
          <option value="a">a</option>
          <option value="b">b</option>
          <option value="c">c</option>
          <option value="d">d</option>
        </select>

        {/* <input className="form-control mb-2" name="marks" value={form.marks} onChange={handleChange} /> */}
<label>Status</label>
        <select className="form-control mb-2" name="status" value={form.status} onChange={handleChange}>
          <option value={1}>Active</option>
          <option value={0}>Inactive</option>
        </select>

        <button className="btn btn-success">Update</button>
&nbsp;
         <button
  type="button"
  className="btn btn-secondary"
  onClick={() => navigate("/questions")}
>
  Back
</button>
      </form>
    </div>
    </AdminLayout>
  );
}

export default EditQuestion;