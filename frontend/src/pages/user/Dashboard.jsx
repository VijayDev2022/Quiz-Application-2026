import { useEffect, useState } from "react";
import api from "../../api";
import AdminLayout from "./adminLayout";

const UserDashboard = () => {
  const [data, setData] = useState(null);

  useEffect(() => {
    api.get("/quiz/dashboard", {
      params: {
        user_id: localStorage.getItem("user_id")
      }
    }).then(res => {
      setData(res.data);
    });
  }, []);

  if (!data) return <h3>Loading...</h3>;

  return (
    <AdminLayout>
      <div className="container mt-4">
        <h2>User Dashboard</h2>

        <div className="row mt-4">

          <div className="col-md-3">
            <div className="card p-3 text-center">
              <h5>Total Quizzes</h5>
              <h3>{data.total_quizzes}</h3>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card p-3 text-center">
              <h5>Attempted</h5>
              <h3>{data.attempted_quizzes}</h3>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card p-3 text-center">
              <h5>Completed</h5>
              <h3>{data.completed_quizzes}</h3>
            </div>
          </div>

          <div className="col-md-3">
            <div className="card p-3 text-center">
              <h5>Average Score</h5>
              <h3>{data.average_score}%</h3>
            </div>
          </div>

        </div>

        {/* Recent Attempts */}
        <div className="mt-5">
          <h4>Recent Attempts</h4>

          <table className="table">
            <thead>
              <tr>
                <th>Quiz</th>
                <th>Score</th>
                <th>Time Taken</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              {data.recent_attempts.map((q, i) => (
                <tr key={i}>
                  <td>{q.quiz_name}</td>
                  <td>{q.score}</td>                  
                  <td>{Math.floor((q.time_limit * 60 - q.time_left) / 60)}:
  {((q.time_limit * 60 - q.time_left) % 60).toString().padStart(2,'0')}</td>
  <td>{q.date}</td>
                </tr>
              ))}
            </tbody> 
          </table>
        </div>

      </div>
    </AdminLayout>
  );
};

export default UserDashboard;