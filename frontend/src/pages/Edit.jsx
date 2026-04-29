import { useEffect, useState } from "react";
import api from "../api";
import { useParams, useNavigate } from "react-router-dom";

function Edit() {
  const { id } = useParams();
  const navigate = useNavigate();

  const [name, setName] = useState("");
  const [price, setPrice] = useState("");

  useEffect(() => {
    api.get(`/products/${id}`).then((res) => {
      setName(res.data.name);
      setPrice(res.data.price);
    });
  }, [id]);

  const updateProduct = async () => {
    await api.put(`/products/${id}`, {
      name,
      price,
    });

    navigate("/dashboard");
  };

  return (
    <div>
      <h2>Edit Product</h2>

      <input
        value={name}
        onChange={(e) => setName(e.target.value)}
      />

      <input
        value={price}
        onChange={(e) => setPrice(e.target.value)}
      />

      <button onClick={updateProduct}>Update</button>
    </div>
  );
}

export default Edit;