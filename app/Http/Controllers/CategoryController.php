<?php 
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    // GET ALL
    public function index()
    {
        return Category::latest()->get();
    }

    // CREATE
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255'
        ]);

        $category = Category::create([
            'name' => $request->name,
            'status' => $request->status ?? 1
        ]);

        return response()->json([
            'message' => 'Category created',
            'data' => $category
        ]);
    }

    // SHOW SINGLE
    public function show($id)
    {
        return Category::findOrFail($id);
    }

    // UPDATE
    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        $category->update([
            'name' => $request->name,
            'status' => $request->status
        ]);

        return response()->json(['message' => 'Category updated']);
    }

    // DELETE
    public function destroy($id)
    {
        Category::findOrFail($id)->delete();

        return response()->json(['message' => 'Category deleted']);
    }
}