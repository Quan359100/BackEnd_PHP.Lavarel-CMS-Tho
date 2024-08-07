<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'author'; 
    protected $fillable = [
        'title', 'slug', 'image', 'description', 'meta_description', 'status', 'deleted_at', 'created_by', 'updated_by', 'deleted_by','authors'
    ];
}

class Page extends Model
{
    protected $fillable = ['authors']; 
}
