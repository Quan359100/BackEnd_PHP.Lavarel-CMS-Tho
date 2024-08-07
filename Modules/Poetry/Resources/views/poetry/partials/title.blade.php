@if (Route::is('admin.poetry.index'))
Poetry
@elseif(Route::is('admin.poetry.create'))
Tạo Câu Thơ Random
@elseif(Route::is('admin.poetry.edit'))
Sửa Câu Thơ Random - {{ $poetries->title }}
@elseif(Route::is('admin.poetry.show'))
View Câu Thơ Random - {{ $poetries->title }}
@elseif(Route::is('admin.poetry.trashed'))
Trashed Poetry
@endif
| Admin Panel -
Thơ Văn CMS
