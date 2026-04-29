import { useEffect, useState } from "react";
import api from "../../api";
import { useNavigate } from "react-router-dom";
import AdminLayout from "./adminLayout";

const QuizList = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(true);

  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 10;

  const navigate = useNavigate();

  // FETCH DATA
  useEffect(() => {
    api.get("/quiz/user").then(res => {
      setData(res.data);
      setCurrentPage(1); // ✅ reset page
      setLoading(false);
    });
  }, []);

  // PAGINATION LOGIC
  const totalPages = Math.ceil(data.length / itemsPerPage);

  const indexOfLast = currentPage * itemsPerPage;
  const indexOfFirst = indexOfLast - itemsPerPage;

  const currentItems = data.slice(indexOfFirst, indexOfLast);

  // HANDLE PAGE OVERFLOW (important)
  useEffect(() => {
    if (currentPage > totalPages) {
      setCurrentPage(totalPages || 1);
    }
  }, [data, totalPages]);

  // PAGINATION BUTTONS WITH DOTS
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

  return (
    <AdminLayout>
      <div className="container mt-4">

        {loading ? (
          <p>Loading...</p>
        ) : (
          <>
            {/* HEADER */}
            <div className="d-flex justify-content-between align-items-center mb-3">
              <h4 className="mb-0">Quiz List</h4>
            </div>

            {/* TABLE */}
            <table className="table table-bordered table-hover">
              <thead className="table-dark">
                <tr>
                  <th>ID</th>
                  <th>Name</th>
                  <th>Time Limit</th>
                  <th>Category</th>
                  <th>Type</th>
                  <th>Action</th>
                </tr>
              </thead>

              <tbody>
                {currentItems.length > 0 ? (
                  currentItems.map((item, index) => (
                    <tr key={item.id}>
                      {/* <td>{item.id}</td> */}
                        <td>{(currentPage - 1) * itemsPerPage + index + 1}</td>
                      <td>{item.name}</td>
                      <td>{item.time_limit}</td>
                      <td>{item.category?.name}</td>
                      <td>{item.type}</td>
                      <td>
                        {/* <button
                          className="btn btn-success"
                          onClick={() =>
                            navigate(`/quiz-user/start/${item.id}`)
                          }
                        >
                          Start Quiz
                        </button> */}

                         {!item.status && (
    <button
      className="btn btn-success"
      onClick={() => navigate(`/quiz-user/start/${item.id}`)}
    >
      Start Quiz
    </button>
  )}

  {(item.status === "running" || item.status === "paused") && (
    <button
      className="btn btn-warning"
      onClick={() => navigate(`/quiz-user/start/${item.id}`)}
    >
      Resume Quiz
    </button>
  )}

  {item.status === "completed" && (
    <span className="badge bg-secondary">
      Completed
    </span>
  )}
                      </td>
                    </tr>
                  ))
                ) : (
                  <tr>
                    <td colSpan="6" className="text-center">
                      No data found
                    </td>
                  </tr>
                )}
              </tbody>
            </table>

            {/* PAGINATION */}
            {totalPages > 1 && (
              <nav>
                <ul className="pagination justify-content-center">

                  {/* PREV */}
                  <li className={`page-item ${currentPage === 1 ? "disabled" : ""}`}>
                    <button
                      className="page-link"
                      onClick={() => setCurrentPage(p => p - 1)}
                    >
                      Prev
                    </button>
                  </li>

                  {/* PAGE NUMBERS */}
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

                  {/* NEXT */}
                  <li className={`page-item ${currentPage === totalPages ? "disabled" : ""}`}>
                    <button
                      className="page-link"
                      onClick={() => setCurrentPage(p => p + 1)}
                    >
                      Next
                    </button>
                  </li>

                </ul>
              </nav>
            )}
          </>
        )}
      </div>
    </AdminLayout>
  );
};

export default QuizList;