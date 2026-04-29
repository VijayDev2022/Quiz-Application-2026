<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Question;

class QuestionController extends Controller
{
    // GET all questions
    public function index()
    {
        //return Question::latest()->get();
        //return Question::orderBy('id', 'desc')->get();
        return Question::select(
        'questions.*',
        'categories.name as category_name'
    )
    ->leftJoin('categories', 'categories.id', '=', 'questions.category_id')
    ->orderBy('questions.id', 'desc')
    ->get();
    }

    // GET single question
    public function show($id)
    {
        return Question::findOrFail($id);
    }

    // STORE new question
    public function store(Request $request)
    {
    
        $request->validate([
            'question' => 'required',
            'category_id' => 'required',
            'option_b' => 'required',
            'option_b' => 'required',
            'correct_answer' => 'required|in:A,B,C,D',
            'image' => 'nullable|image'
        ]);

        $imagePath = null;

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('questions', 'public');
        }

        $question = Question::create([
            'question' => $request->question,
            'option_a' => $request->option_a,
            'category_id' => $request->category_id,
            'option_b' => $request->option_b,
            'option_c' => $request->option_c,
            'option_d' => $request->option_d,
            'correct_answer' => $request->correct_answer,
            'explanation' => $request->explanation,
            'marks' => $request->marks ?? 1,
            'image' => $imagePath,
            'csv_upload' => $request->csv_upload,
            'status' => $request->status ?? 1,
        ]);

        return response()->json([
            'message' => 'Question created',
            'data' => $question
        ]);
    }

    // UPDATE question
    public function update(Request $request, $id)
    {
        $question = Question::findOrFail($id);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('questions', 'public');
            $question->image = $imagePath;
        }

        $question->update([
            'question' => $request->question,
            'option_a' => $request->option_a,
            'category_id' => $request->category_id,
            'option_b' => $request->option_b,
            'option_c' => $request->option_c,
            'option_d' => $request->option_d,
            'correct_answer' => $request->correct_answer,
            'explanation' => $request->explanation,
            'marks' => $request->marks,
            'status' => $request->status,
        ]);

        return response()->json(['message' => 'Updated successfully']);
    }

    // DELETE question
    public function destroy($id)
    {
        Question::findOrFail($id)->delete();

        return response()->json(['message' => 'Deleted successfully']);
    }
}