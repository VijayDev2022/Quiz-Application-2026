import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../api";
import AdminLayout from "./adminLayout";

function CreateCategory() {
  const navigate = useNavigate();

  const [form, setForm] = useState({
    name: "",
    
  });

 /// const [image, setImage] = useState(null);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  // const handleFileChange = (e) => {
  //   setImage(e.target.files[0]);
  // };

  const  handleSubmit = async (e) => {
    e.preventDefault();

    const formData = new FormData();

    Object.keys(form).forEach((key) => {
      formData.append(key, form[key]);
    });

    // if (image) {
    //   formData.append("image", image);
    // }

    try {
      await api.post("/categories", formData, {
       
      });

      alert("Category created successfully");
      // navigate("/");
      window.location.reload();
    } catch (error) {
      console.error("Create error:", error);
    }
  };

  return (
    <AdminLayout>
    <div className="container mt-4">
      <h4>Create Category</h4>

      <form onSubmit={handleSubmit}>
        <input
          className="form-control mb-2"
          name="name"
          placeholder="Category"
          onChange={handleChange} required  
        />
        <button type="submit" className="btn btn-success">
  Create
</button>
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

export default CreateCategory;