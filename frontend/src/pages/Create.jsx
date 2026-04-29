import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function CreateQuestion() {
  const navigate = useNavigate();

  const [form, setForm] = useState({
    question: "",
    category_id: "",
    option_a: "",
    option_b: "",
    option_c: "",
    option_d: "",
    correct_answer: "A",
    explanation: "",
    marks: 1,
    status: 1,
  });

  const [image, setImage] = useState(null);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleFileChange = (e) => { 
    setImage(e.target.files[0]);
  };

  const [categories, setCategories] = useState([]);
  useEffect(() => {
  api.get("/categories").then((res) => {
     setCategories(res.data);
  });
}, []);


  const handleSubmit = async (e) => {
    e.preventDefault();

    const formData = new FormData();

    Object.keys(form).forEach((key) => {
      formData.append(key, form[key]);
    });

    if (image) {
      formData.append("image", image);
    }

    try {
      await api.post("/questions/store", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
        },
      });

      alert("Question created successfully");
      // navigate("/");
      window.location.reload();
    } catch (error) {
      console.error("Create error:", error);
    }
  };

  return (
    <AdminLayout>
    <div className="container mt-4">
      <h4>Create Question</h4>

      <form onSubmit={handleSubmit}>
        <input
          className="form-control mb-2"
          name="question"
          placeholder="Question"
          onChange={handleChange} required  
        />

        <input className="form-control mb-2" name="option_a" placeholder="Option A" onChange={handleChange} required />
        <input className="form-control mb-2" name="option_b" placeholder="Option B" onChange={handleChange} required/>
        <input className="form-control mb-2" name="option_c" placeholder="Option C" onChange={handleChange} required />
        <input className="form-control mb-2" name="option_d" placeholder="Option D" onChange={handleChange} required/>

        <select className="form-control mb-2" name="correct_answer" onChange={handleChange}>
          <option value="A">A</option>
          <option value="B">B</option>
          <option value="C">C</option>
          <option value="D">D</option>
        </select>

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

        <textarea
          className="form-control mb-2"
          name="explanation"
          placeholder="Explanation"
          onChange={handleChange}
        />

        {/* <input
          type="number"
          className="form-control mb-2"
          name="marks"
          defaultValue={1}
          onChange={handleChange}
        /> */}

        {/* <input
          type="file"
          className="form-control mb-2"
          onChange={handleFileChange}
        /> */}
{/* 
        <select className="form-control mb-2" name="status" onChange={handleChange}>
          <option value={1}>Active</option>
          <option value={0}>Inactive</option>
        </select> */}

        <button type="submit" className="btn btn-success">
  Create
</button>
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

export default CreateQuestion;