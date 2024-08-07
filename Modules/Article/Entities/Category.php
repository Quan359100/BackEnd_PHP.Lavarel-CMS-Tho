<?php

namespace Modules\Article\Entities;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'slug', 'description', 'status', 'bg_color', 'deleted_at', 'created_by', 'updated_by', 'deleted_by'
    ];

    public function pages()
    {
        return $this->hasMany(Page::class)->where('status', 1);
    }

    /**
     * getCategories
     *
     * @param integer $status
     * @param string $deleted_at
     * @param integer $parent_category_id
     * @return void
     */
    public static function getCategories($status = 1, $deleted_at = null)
    {
        try {
            $categories = Category::where('status', 1) // Lấy các danh mục hoạt động
                ->whereNull('deleted_at') // Loại trừ các danh mục đã bị xóa (soft delete)
                ->orderBy('priority', 'asc')
                ->get(['id', 'name', 'slug']); // Chỉ lấy các trường cần thiết
    
            // Decode HTML entities cho các trường có dữ liệu dạng chuỗi
            $decodedCategories = $categories->map(function ($category) {
                foreach ($category->getAttributes() as $key => $value) {
                    // Kiểm tra liệu giá trị có phải là chuỗi không trước khi decode
                    if (is_string($value)) {
                        $category->$key = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
                    }
                }
                return $category;
            });
    
            return response()->json([
                'success' => true,
                'categories' => $decodedCategories
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * printCategory
     *
     * Prints the category on view directly
     *
     * @param integer $category_id
     * @param integer $layer
     * @return void
     */
    // public static function printCategory($category_id = null, $layer = 3)
    // {
    //     $html = "";
    //     $parentCategories = Category::select('id', 'name')->get();

    //     foreach ($parentCategories as $parent) {
    //         if ($category_id === $parent->id)    $selected = " selected";
    //         else  $selected = "";
    //         $html .= "<option value='" . $parent->id . "'" . $selected . ">" . $parent->name . "</option>";

    //         // Get Sub Categories
    //         $childCategories = Category::select('id', 'name')->where('parent_category_id', $parent->id)->get();
    //         foreach ($childCategories as $child) {


    //             if ($category_id === $child->id)    $selected = " selected";
    //             else  $selected = "";
    //             $html .= "<option value='" . $child->id . "' " . $selected . ">&nbsp;&nbsp;&nbsp;&nbsp;-- " . $child->name . "</option>";

    //             if ($layer === 3) {
    //                 // Get Sub Categories 2
    //                 $childCategories2 = Category::select('id', 'name')->where('parent_category_id', $child->id)->get();
    //                 foreach ($childCategories2 as $child2) {
    //                     if ($category_id === $child2->id)    $selected = " selected";
    //                     else  $selected = "";
    //                     $html .= "<option value='" . $child2->id . "' " . $selected . ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-- " . $child2->name . "</option>";
    //                 }
    //             }
    //         }
    //     }
    //     return $html;
    // }
}
