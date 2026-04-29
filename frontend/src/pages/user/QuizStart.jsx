import { useEffect, useState } from "react";
import { useParams,useNavigate  } from "react-router-dom";
import api from "../../api";
import AdminLayout from "./adminLayout";

const QuizStart = () => {
  const { id } = useParams();

  const navigate = useNavigate();

  const [questions, setQuestions] = useState([]);
  const [current, setCurrent] = useState(0);

  const [answers, setAnswers] = useState({});
  const [time, setTime] = useState(300);

  const [isRunning, setIsRunning] = useState(false);
  const [attemptId, setAttemptId] = useState(null);
  const [isCompleted, setIsCompleted] = useState(false);

  // LOAD QUESTIONS
  useEffect(() => {
    const userId = localStorage.getItem("user_id");

    api.get(`/getquizquestions/${id}`, {
      params: { user_id: userId }
    }).then(res => {
      setQuestions(res.data.questions);

      const quizTime = res.data.quiz.time_limit * 60;

      if (res.data.attempts && res.data.attempts.id) {
        setAttemptId(res.data.attempts.id);
        setTime(res.data.attempts.time_left);
        setCurrent(res.data.attempts.current_question || 0);

        // resume state (NEW)
        if (res.data.attempts.status === "running") {
          setIsRunning(true);
        }
      } else {
        setTime(quizTime || 300);
      }
    });
  }, [id]);

  // TIMER
  useEffect(() => {
    if (!isRunning || isCompleted) return;

    const timer = setInterval(() => {
      setTime(prev => {
        if (prev <= 1) {
          clearInterval(timer);
          finishQuiz();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [isRunning, isCompleted]);

  // START
  const startQuiz = () => {
    api.post("/quiz/start", {
      user_id: localStorage.getItem("user_id"),
      quiz_id: id,
      time_left: time
    }).then(res => {
      setAttemptId(res.data.attempt_id);
      setIsRunning(true);
    });
  };

  // ❗ PAUSE (NEW)
  const pauseQuiz = async () => {
    setIsRunning(false);

    await api.post("/quiz/pause", {
      attempt_id: attemptId,
      time_left: time,
      current_question: current
    });
  };

  // ❗ RESUME (NEW)
  const resumeQuiz = async () => {
    await api.post("/quiz/resume", {
      attempt_id: attemptId
    });

    setIsRunning(true);
  };

  // SAVE ANSWER
  const saveAnswer = async (qid, answer) => {
    await api.post("/quiz/save-answer", {
      attempt_id: attemptId,
       time_left: time,
      question_id: qid,
      answer
    });
  };

  // NEXT
  const handleNext = async () => {
    const q = questions[current];
    const selected = answers[q.id];

    await saveAnswer(q.id, selected);

    if (current < questions.length - 1) {
      setCurrent(current + 1);
    }
  };

  // PREV
  const handlePrev = () => {
    if (current > 0) setCurrent(current - 1);
  };

  // FINISH QUIZ
  const finishQuiz = async () => {
    if (isCompleted) return;

    const q = questions[current];
    const selected = answers[q.id];

    if (q && selected) {
      await saveAnswer(q.id, selected);
    }

    setIsCompleted(true);
    setIsRunning(false);

    await api.post("/quiz/complete", {
      attempt_id: attemptId
    });
  };

  // FORMAT TIME
  const formatTime = (t) => {
    const m = Math.floor(t / 60);
    const s = t % 60;
    return `${m}:${s < 10 ? "0" : ""}${s}`;
  };

  if (!questions.length) return <h3>Loading...</h3>;

  const q = questions[current] || {};

  // RESULT SCREEN
  if (isCompleted) {
    return (
      <AdminLayout>
        <div className="container mt-4 text-center">
          <h2>🎉 Quiz Completed</h2>
          <button
            className="btn btn-primary mt-3"
            onClick={() => navigate("/quiz-user")}
          >
            Restart
          </button>
        </div>
      </AdminLayout>
    );
  }

  return (
    <AdminLayout>
      <div className="container mt-4">

        <h2>Quiz Page</h2>

        <h3>Time: {formatTime(time)}</h3>

        {/* START / PAUSE / RESUME (NEW) */}
        {!attemptId && (
          <button className="btn btn-primary" onClick={startQuiz}>
            Start Quiz
          </button>
        )}

        {attemptId && !isCompleted && (
          <>
            {isRunning ? (
              <button className="btn btn-warning ms-2" onClick={pauseQuiz}>
                Pause Quiz
              </button>
            ) : (
              <button className="btn btn-success ms-2" onClick={resumeQuiz}>
                Resume Quiz
              </button>
            )}
          </>
        )}

        <hr />

        {/* QUESTION */}
        <h4>Q{current + 1}. {q.question}</h4>

        <div>
          {["a", "b", "c", "d"].map(opt => (
            <label key={opt}>
              <input
                type="radio"
                name={q.id}
                checked={answers[q.id] === opt}
                onChange={() =>
                  setAnswers({ ...answers, [q.id]: opt })
                }
              />
              &nbsp;{q[`option_${opt}`]}&nbsp;&nbsp;&nbsp;&nbsp;
              <br />
            </label>
          ))}
        </div>

        <hr />

        {/* NAVIGATION */}
        <button
          className="btn btn-secondary me-2"
          onClick={handlePrev}
          disabled={current === 0}
        >
          Prev
        </button>

        {current < questions.length - 1 ? (
          <button className="btn btn-primary" onClick={handleNext}>
            Next
          </button>
        ) : (
          <button className="btn btn-success" onClick={finishQuiz}>
            Submit Quiz
          </button>
        )}

      </div>
    </AdminLayout>
  );
};

export default QuizStart;