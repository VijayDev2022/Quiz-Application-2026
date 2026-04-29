import { useEffect, useState } from "react";
import api from "../api";
import { useNavigate } from "react-router-dom";
import AdminLayout from "./adminLayout";

function QuestionsPage() {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);
  const [currentPage, setCurrentPage] = useState(1);

  const navigate = useNavigate();

  const itemsPerPage = 10;

  // Fetch data
  useEffect(() => {
    fetchQuestions();
  }, []);

  const fetchQuestions = async () => {
    try {
      const res = await api.get("/quizzes");
      setData(res.data); // if pagination: res.data.data
    } catch (error) {
      console.error("Error fetching quizzes:", error);
    } finally {
      setLoading(false);
    }
  };

  // Pagination
  const totalPages = Math.ceil(data.length / itemsPerPage);

  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;
  const currentItems = data.slice(indexOfFirst, indexOfLast);

  // Pagination with dots
  const getPages = () => {
    const pages = [];

    if (totalPages <= 7) {
      for (let i = 1; i <= totalPages; i++) pages.push(i);
    } else {
      pages.push(1);

      if (currentPage > 3) pages.push("...");

      const start = Math.max(2, currentPage - 1);
      const end = Math.min(totalPages - 1, currentPage + 1);

      for (let i = start; i <= end; i++) {
        pages.push(i);
      }

      if (currentPage < totalPages - 2) pages.push("...");

      pages.push(totalPages);
    }

    return pages;
  };

  // Delete
  const handleDelete = async (id) => {
    if (!window.confirm("Delete this question?")) return;

    try {
      await api.delete(`/quizzes/${id}`);
      setData((prev) => prev.filter((item) => item.id !== id));
    } catch (error) {
      console.error("Delete error:", error);
    }
  };

  // Edit
  const handleEdit = (id) => {
    navigate(`/edit-quiz/${id}`);
  };

  return (
    <AdminLayout>
      <div className="container mt-4">
        {/* <h4 className="mb-3">Questions List</h4> */}
        {loading ? (
          <p>Loading...</p>
        ) : (
          <>

          <div className="d-flex justify-content-between align-items-center mb-3">
  <h4 className="mb-0">Quiz List</h4>

  <button
    className="btn btn-success"
    onClick={() => navigate("/create-quiz")}
  >
    + Create Quiz
  </button>
</div>
            {/* Table */}
            
            <table className="table table-bordered table-hover">
              <thead className="table-dark">
                <tr>
                  <th>ID</th>
                  <th>Name</th>                                   
                  <th>Time Limit</th>
                  <th>Category</th>
                  <th>Type</th>
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>

              <tbody>
                {currentItems.map((item,index) => (
                  <tr key={item.id}>
                    {/* <td>{item.id}</td> */}
                    <td>{(currentPage - 1) * itemsPerPage + index + 1}</td>

                    <td>{item.name}</td>
                    <td>{item.time_limit}</td>
                    <td>{item.category.name}</td>
                    <td>{item.type}</td>

                    <td>
                      {item.status === 1 ? (
                        <span className="badge bg-success">Active</span>
                      ) : (
                        <span className="badge bg-danger">Inactive</span>
                      )}
                    </td>

                    <td>
                      <button
                        className="btn btn-sm btn-primary me-2"
                        onClick={() => handleEdit(item.id)}
                      >
                        Edit
                      </button>

                      <button
                        className="btn btn-sm btn-danger"
                        onClick={() => handleDelete(item.id)}
                      >
                        Delete
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>

            {/* Pagination */}
            <nav>
              <ul className="pagination justify-content-center">
                {/* Prev */}
                <li
                  className={`page-item ${
                    currentPage === 1 ? "disabled" : ""
                  }`}
                >
                  <button
                    className="page-link"
                    onClick={() => setCurrentPage((p) => p - 1)}
                  >
                    Prev
                  </button>
                </li>

                {/* Pages */}
                {getPages().map((page, index) => (
                  <li
                    key={index}
                    className={`page-item ${
                      page === currentPage ? "active" : ""
                    } ${page === "..." ? "disabled" : ""}`}
                  >
                    <button
                      className="page-link"
                      onClick={() => {
                        if (page !== "...") setCurrentPage(page);
                      }}
                    >
                      {page}
                    </button>
                  </li>
                ))}

                {/* Next */}
                <li
                  className={`page-item ${
                    currentPage === totalPages ? "disabled" : ""
                  }`}
                >
                  <button
                    className="page-link"
                    onClick={() => setCurrentPage((p) => p + 1)}
                  >
                    Next
                  </button>
                </li>
              </ul>
            </nav>
          </>
        )}
      </div>
    </AdminLayout>
  );
}

export default QuestionsPage;