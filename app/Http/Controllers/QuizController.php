<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Quiz;
use Illuminate\Support\Facades\DB;

class QuizController extends Controller
{
    // GET ALL
    public function index()
    {
        return Quiz::with('category')
            ->orderBy('id', 'desc')
            ->get();
    }

    // CREATE
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'time_limit' => 'required|integer',
            'type' => 'required|in:easy,medium,difficult'
        ]);

        $quiz = Quiz::create([
            'name' => $request->name,
            'time_limit' => $request->time_limit,
            'category_id' => $request->category_id,
            'type' => $request->type,
            'status' => $request->status ?? 1,
        ]);

        return response()->json([
            'message' => 'Quiz created',
            'data' => $quiz
        ]);
    }

    // SHOW
    public function show($id)
    {
        return Quiz::with('category')->findOrFail($id);
    }

    // UPDATE
    public function update(Request $request, $id)
    {
        $quiz = Quiz::findOrFail($id);

        $quiz->update([
            'name' => $request->name,
            'time_limit' => $request->time_limit,
            'category_id' => $request->category_id,
            'type' => $request->type,
            'status' => $request->status,
        ]);

        return response()->json(['message' => 'Quiz updated']);
    }

    // DELETE
    public function destroy($id)
    {
        Quiz::findOrFail($id)->delete();

        return response()->json(['message' => 'Quiz deleted']);
    }

public function getquizquestions($id, Request $request)
    {   
        $userId = $request->user_id;

        $quiz = DB::table('quizzes')
            ->where('id', $id)
            ->first();

        $questions = DB::table('questions')
            ->where('category_id', $quiz->category_id)
            ->get();

         $attempts = DB::table('quiz_attempts')
            ->where('quiz_id', $quiz->id)
            ->where('user_id', $userId)
            ->where('status','!=','completed')
            ->orderBy('id', 'desc')
            ->first();

        return response()->json([
            'quiz' => $quiz,
            'questions' => $questions,
            'attempts' => $attempts
            
        ]);
    }

    public function startQuiz(Request $request)
{
    $userId = $request->user_id;
    $quizId = $request->quiz_id;

    // 👉 check existing attempt
    $existing = DB::table('quiz_attempts')
        ->where('user_id', $userId)
        ->where('quiz_id', $quizId)
        ->whereIn('status', ['running', 'paused'])
        ->orderBy('id', 'desc')
        ->first();

    // 👉 resume if exists
    if ($existing) {
        return response()->json([
            'attempt_id' => $existing->id,
            'status' => $existing->status,
            'time_left' => $existing->time_left,
            'current_question' => $existing->current_question
        ]);
    }

    // 👉 create new attempt
    $attemptId = DB::table('quiz_attempts')->insertGetId([
        'user_id' => $userId,
        'quiz_id' => $quizId,
        'time_left' => $request->time_left,
        'status' => 'running',
        'current_question' => 0,
        'answers' => json_encode([]),
        'created_at' => now(),
        'updated_at' => now()
    ]);

    return response()->json([
        'attempt_id' => $attemptId,
        'status' => 'running',
        'time_left' => $request->time_left,
        'current_question' => 0
    ]);
}

    public function pauseQuiz(Request $request)
{
    DB::table('quiz_attempts')
        ->where('id', $request->attempt_id)
        ->update([
            'time_left' => $request->time_left,
            'current_question' => $request->current_question,
            'status' => 'paused',
            'updated_at' => now()
        ]);

    return response()->json(['message' => 'paused']);
}

    public function resumeQuiz(Request $request)
{
    return DB::table('quiz_attempts')
        ->where('user_id', $request->user_id)
        ->where('quiz_id', $request->quiz_id)
        ->where('status', 'paused')
        ->orderBy('id', 'desc')
        ->first();
}

// public function completeQuiz(Request $request)
// {
//     DB::table('quiz_attempts')
//         ->where('id', $request->attempt_id)
//         ->update([
//             'answers' => json_encode($request->answers),
//             'status' => 'completed',
//             'updated_at' => now()
//         ]);

//     return response()->json([
//         'message' => 'Quiz completed successfully'
//     ]);
// }

public function saveAnswer(Request $request)
{
    $attempt = DB::table('quiz_attempts')
        ->where('id', $request->attempt_id)
        ->first();
       

    if (!$attempt || $attempt->status === 'completed') {
        return response()->json(['message' => 'Locked'], 403);
    }

     $answers = json_decode($attempt->answers, true) ?? [];

    $answers[$request->question_id] = $request->answer;

    DB::table('quiz_attempts')
        ->where('id', $request->attempt_id)
        ->update([
            'answers' => json_encode($answers),
            'current_question' => $request->question_id,
            'time_left' => $request->time_left,
            'updated_at' => now()
        ]);

    return response()->json(['message' => 'saved']);
}


public function completeQuiz(Request $request)
{
    
    $attempt = DB::table('quiz_attempts')
        ->where('id', $request->attempt_id)
        ->first();

       

    if (!$attempt || $attempt->status === 'completed') {
        return response()->json(['message' => 'Already completed']);
    }

     $answers = json_decode($attempt->answers, true) ?? [];

    // AUTO SCORE CALCULATION
    $questions = DB::table('questions')
        ->where('category_id', function($q) use ($attempt) {
            $q->select('category_id')
              ->from('quizzes')
              ->where('id', $attempt->quiz_id);
        })
        ->get();

    $score = 0;

    foreach ($questions as $q) {
        if (isset($answers[$q->id]) && $answers[$q->id] == $q->correct_answer) {
            $score++;
        }
    }

    DB::table('quiz_attempts')
        ->where('id', $request->attempt_id)
        ->update([
            'answers' => json_encode($answers),
            'score' => $score,
            'status' => 'completed',
            'updated_at' => now()
        ]);

    return response()->json([
        'message' => 'Quiz completed',
        'score' => $score
    ]);
}

    public function userScoreArea(Request $request)
    {
        $userId = $request->user_id;

        // TOTAL QUIZZES
        $totalQuizzes = DB::table('quizzes')->count();

        // ATTEMPTED QUIZZES (unique quiz_ids)
        $attemptedQuizzes = DB::table('quiz_attempts')
            ->where('user_id', $userId)
            ->distinct('quiz_id')
            ->count('quiz_id');

        // // COMPLETED QUIZZES
        $completedQuizzes = DB::table('quiz_attempts')
            ->where('user_id', $userId)
            ->where('status', 'completed')
            
            ->count();

        // // AVERAGE SCORE
        $averageScore = DB::table('quiz_attempts')
            ->where('user_id', $userId)
            ->where('status', 'completed')
            ->avg('score');

        // RECENT ATTEMPTS
        $recentAttempts = DB::table('quiz_attempts')
            ->join('quizzes', 'quiz_attempts.quiz_id', '=', 'quizzes.id')
            ->where('quiz_attempts.user_id', $userId)
            ->select(
                'quizzes.name as quiz_name',
                'quiz_attempts.score',
                'quiz_attempts.updated_at as date',
                'quiz_attempts.time_left as time_left',
                'quizzes.time_limit as time_limit'
            )
            ->orderBy('quiz_attempts.updated_at', 'desc')
            ->limit(5)
            ->get();

        return response()->json([
            'total_quizzes' => $totalQuizzes,
            'attempted_quizzes' => $attemptedQuizzes,
             'completed_quizzes' => $completedQuizzes,
             'average_score' => round($averageScore, 2),
            'recent_attempts' => $recentAttempts
        ]);
    }

     public function quizuser()
    {
        

$userId = auth()->id();

return $quizzes = Quiz::select('quizzes.*', 'quiz_attempts.status')
    ->leftJoin('quiz_attempts', function ($join) use ($userId) {
        $join->on('quizzes.id', '=', 'quiz_attempts.quiz_id')
             ->where('quiz_attempts.user_id', $userId);
    })
    ->where('quizzes.status', 1)
    ->with('category')
    ->orderBy('quizzes.id', 'desc')
    ->get();
    }

    public function leaderboard($quizId)
    {
        $data = DB::table('quiz_attempts')
            ->join('users', 'users.id', '=', 'quiz_attempts.user_id')
            ->join('quizzes', 'quiz_attempts.quiz_id', '=', 'quizzes.id')
            ->select(
                'quiz_attempts.id',
                'quiz_attempts.score',
                'quiz_attempts.time_left',
                'users.name as user_name',
                'quiz_attempts.quiz_id as quiz_id',
                'quizzes.time_limit as time_limit',

            )
            ->where('quiz_attempts.quiz_id', $quizId)
            ->where('quiz_attempts.status', 'completed')
            ->orderByDesc('quiz_attempts.score')
          //  ->orderBy('quiz_attempts.time_taken', 'asc')
            ->get();

        // Add rank manually
        $ranked = $data->values()->map(function ($item, $index) {
            $item->rank = $index + 1;
            return $item;
        });

        return response()->json($ranked);
    }

}
