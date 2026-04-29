import { BrowserRouter, Routes, Route } from "react-router-dom";

import Login from "./pages/Login";
import Dashboard from "./pages/Leaderboard";
import Create from "./pages/Create";
import Edit from "./pages/Edit";
import Logout from "./pages/Logout";
import Questions from "./pages/Questions";
import EditQuestion from "./pages/EditQuestion";

import Categories from "./pages/Categories";
import CreateCategory from "./pages/CreateCategory";
import EditCategory from "./pages/EditCategory";

import Quiz from "./pages/Quiz";
import CreateQuiz from "./pages/CreateQuiz";
import EditQuiz from "./pages/EditQuiz";

import Users from "./pages/User";

// import Leaderboard from "./pages/Leaderboard";

import QuizUser from "./pages/user/Dashboard";
import Quizlist from "./pages/user/Quizlist";
import QuizStart from "./pages/user/QuizStart";

import QuizUserScore from "./pages/user/Dashboard";




import ProtectedRoute from "./ProtectedRoute";


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        
        <Route path="/dashboard" element={<ProtectedRoute allowedRole="admin"><Dashboard /></ProtectedRoute>} />
        {/* <Route path="/leaderboard" element={<ProtectedRoute allowedRole="admin"><Leaderboard /></ProtectedRoute>} /> */}
        
        <Route path="/edit/:id" element={<ProtectedRoute allowedRole="admin"><Edit /></ProtectedRoute>} />
        <Route path="/logout" element={<ProtectedRoute allowedRole="admin"><Logout /></ProtectedRoute>} />

        <Route path="/create" element={<ProtectedRoute allowedRole="admin"><Create /></ProtectedRoute>} />
        <Route path="/questions" element={<ProtectedRoute allowedRole="admin"><Questions /></ProtectedRoute>} />
        <Route path="/edit-question/:id" element={<ProtectedRoute allowedRole="admin"><EditQuestion /></ProtectedRoute>} />
        

        <Route path="/users/" element={<ProtectedRoute allowedRole="admin">< Users/></ProtectedRoute>} />
        
        <Route path="/categories/" element={<ProtectedRoute allowedRole="admin">< Categories/></ProtectedRoute>} />
        <Route path="/Createcategory/" element={<ProtectedRoute allowedRole="admin">< CreateCategory/></ProtectedRoute>} />
        <Route path="/edit-category/:id" element={<ProtectedRoute><EditCategory /></ProtectedRoute>} />

        <Route path="/quiz/" element={<ProtectedRoute allowedRole="admin"><Quiz /></ProtectedRoute>} />
        <Route path="/create-quiz/" element={<ProtectedRoute allowedRole="admin"><CreateQuiz /></ProtectedRoute>} />
        <Route path="/edit-quiz/:id" element={<ProtectedRoute allowedRole="admin"><EditQuiz /></ProtectedRoute>} />



        <Route path="/quiz-user/" element={<ProtectedRoute allowedRole="user"><QuizUser /></ProtectedRoute>} />
        <Route path="/quiz-user/list" element={<ProtectedRoute allowedRole="user"><Quizlist /></ProtectedRoute>} />
        <Route path="/quiz-user/start/:id" element={<ProtectedRoute allowedRole="user"><QuizStart /></ProtectedRoute>} />
        <Route
          path="/quiz-start/:id"
          element={
            <ProtectedRoute allowedRole="user">
              <QuizStart />
            </ProtectedRoute>
          }
        />


      </Routes>
    </BrowserRouter>
  );
}

export default App;