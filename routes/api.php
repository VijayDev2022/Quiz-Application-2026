<?php

use App\Http\Controllers\API\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\QuestionController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\QuizController;
use App\Http\Controllers\UserController;




/*
|----------------------------------------------------------------------     ----
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// AUTH
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);


// PROTECTED ROUTES
Route::middleware('auth:sanctum')->group(function () {

    Route::get('/profile', function (Request $request) {
        return $request->user();
    });

    Route::post('/logout', [AuthController::class, 'logout']);

    // ADMIN ONLY
    Route::middleware('role:admin')->group(function () {
        Route::get('/admin/dashboard', function () {
            return response()->json(['message' => 'Welcome Admin']);
        });

          // ✅ QUESTION MANAGEMENT (ADMIN)
        Route::post('/questions', [QuestionController::class, 'index']);
        Route::post('/questions/store', [QuestionController::class, 'store']);
        Route::put('/questions/{id}', [QuestionController::class, 'update']);
        Route::delete('/questions/{id}', [QuestionController::class, 'destroy']);
        Route::get('/questions/show/{id}', [QuestionController::class, 'show']);

        Route::get('/categories', [CategoryController::class, 'index']);
        Route::post('/categories', [CategoryController::class, 'store']);
        Route::get('/categories/{id}', [CategoryController::class, 'show']);
        Route::put('/categories/{id}', [CategoryController::class, 'update']);
        Route::delete('/categories/{id}', [CategoryController::class, 'destroy']);

    
        Route::get('/quizzes', [QuizController::class, 'index']);
        Route::post('/quizzes', [QuizController::class, 'store']);
        Route::get('/quizzes/{id}', [QuizController::class, 'show']);
        Route::put('/quizzes/{id}', [QuizController::class, 'update']);
        Route::delete('/quizzes/{id}', [QuizController::class, 'destroy']);

        Route::get('/admin/leaderboard/{quizId}', [QuizController::class, 'leaderboard']);


         Route::get('/users', [UserController::class, 'index']);         // List all users
        Route::post('/users', [UserController::class, 'store']);        // Create new user
        Route::get('/users/{id}', [UserController::class, 'show']);     // Show user details
        Route::put('/users/{id}', [UserController::class, 'update']);   // Update user
        Route::delete('/users/{id}', [UserController::class, 'destroy']); // Delete user

        
    });

    

    // USER ONLY
    Route::middleware('role:user')->group(function () {
        Route::get('/user/dashboard', function () {
            return response()->json(['message' => 'Welcome User']);
        });

        Route::get('/quiz/user', [QuizController::class, 'quizuser']);       
        Route::get('/getquizquestions/{id}', [QuizController::class, 'getquizquestions']);
        Route::post('/quiz/start', [QuizController::class, 'startQuiz']);
        Route::post('/quiz/pause', [QuizController::class, 'pauseQuiz']);
        Route::post('/quiz/resume', [QuizController::class, 'resumeQuiz']);
        Route::post('/quiz/complete', [QuizController::class, 'completeQuiz']);

        Route::post('/quiz/save-answer', [QuizController::class, 'saveAnswer']);

        Route::get('/quiz/dashboard', [QuizController::class, 'userScoreArea']);


    });
});
