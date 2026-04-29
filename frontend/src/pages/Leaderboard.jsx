import { useEffect, useState } from "react";
import api from "../api";
import { isLoggedIn } from "../auth";
import { useNavigate } from "react-router-dom";
import AdminLayout from "./adminLayout";

function Dashboard() {
  if (!isLoggedIn()) {
    window.location.href = "/";
    return null;
  }

  const navigate = useNavigate();
  const [quizzes, setQuizzes] = useState([]);
  const [leaderboard, setLeaderboard] = useState([]);
  const [selectedQuiz, setSelectedQuiz] = useState(null);

  // LOAD QUIZZES
  const loadQuizzes = async () => {
    const res = await api.get("/quizzes");
    setQuizzes(res.data);
  };

  // LOAD LEADERBOARD
  const loadLeaderboard = async (quiz) => {
    setSelectedQuiz(quiz);
    const res = await api.get(`/admin/leaderboard/${quiz.id}`);

    setLeaderboard(res.data);
  };

  useEffect(() => {
    loadQuizzes();
  }, []);

  return (
    <AdminLayout>
      <div className="container mt-4">

        <div className="d-flex justify-content-between align-items-center mb-4">
          <h2>Quiz Admin Dashboard</h2>
          {/* <div>
            <button
              className="btn btn-primary me-2"
              onClick={() => navigate("/quiz/create")}
            >
              Create Quiz
            </button>
            <button
              className="btn btn-danger"
              onClick={() => navigate("/logout")}
            >
              Log out
            </button>
          </div> */}
        </div>

        {/* QUIZ LIST */}
        <div className="row">
          {quizzes.map((q) => (
            <div className="col-md-4 mb-3" key={q.id}>
              <div className="card h-100 shadow-sm">
                <div className="card-body d-flex flex-column">
                  <h5 className="card-title">{q.name}</h5>
                  <p className="card-text mb-3">
                    <strong>Category:</strong> {q.category?.name || "N/A"} <br />
                    <strong>Time Limit:</strong> {q.time_limit} min
                  </p>
                  <button
                    className="btn btn-success mt-auto"
                    onClick={() => loadLeaderboard(q)}
                  >
                    🏆 View Leaderboard
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* LEADERBOARD SECTION */}
        {selectedQuiz && (
          <div className="mt-5">
            <h3 className="mb-3">🏆 Leaderboard ( {selectedQuiz?.name || "Quiz"})</h3>
            <div className="table-responsive">
              <table className="table table-bordered table-striped table-hover">
                <thead className="table-dark">
                  <tr>
                    <th>Rank</th>
                    <th>User</th>
                    <th>Score</th>
                    <th>Time Taken</th>
                  </tr>
                </thead>
                <tbody>
                  {leaderboard.length > 0 ? (
                    leaderboard.map((item) => (
                      <tr key={item.id}>
                        <td>{item.rank}</td>
                        <td>{item.user_name}</td>
                        <td>{item.score}</td>
                        <td> {Math.floor((item.time_limit * 60 - item.time_left) / 60)}:
  {((item.time_limit * 60 - item.time_left) % 60).toString().padStart(2,'0')}</td>
                      </tr>
                    ))
                  ) : (
                    <tr>
                      <td colSpan="4" className="text-center">
                        No data found
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        )}

      </div>
    </AdminLayout>
  );
}

export default Dashboard;