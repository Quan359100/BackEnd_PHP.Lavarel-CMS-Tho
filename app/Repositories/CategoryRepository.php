<?php

namespace App\Repositories;

use App\Models\Category;

class CategoryRepository
{
    /**
     * Get Category Detail By ID/Code/ Other SQL table's column
     *
     * @param string $column_name
     *
     * @param string $value
     *
     * @return Object $language Object
     */
    public function get_category_detail($column_name = 'id', $value)
    {

        if ($column_name === 'id') {
            $term = Category::find($value);
        } else {
            $term = Category::where($column_name, $value)->limit(1)->first();
        }

        return $term;
    }

}
