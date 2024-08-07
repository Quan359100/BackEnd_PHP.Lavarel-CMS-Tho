@if (Route::is('admin.categories.index'))
Phân Loại
@elseif(Route::is('admin.categories.create'))
Tạo Phân Loại Mới
@elseif(Route::is('admin.categories.edit'))
Sửa Phân Loại- {{ $category->name }}
@elseif(Route::is('admin.categories.trashed'))
Trashed Phân Loại
@endif
| Admin Panel -
Thơ Văn CMS
