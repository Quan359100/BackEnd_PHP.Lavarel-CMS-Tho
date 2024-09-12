@if (Route::is('admin.authors.index'))
Danh Sách Tác Giả
@elseif(Route::is('admin.authors.create'))
Thông tin Tác Giả 
@elseif(Route::is('admin.authors.edit'))
Sửa Thông tin Tác Giả {{ $authors->title }}
@elseif(Route::is('admin.authors.show'))
Thông tin chi tiết tác giả {{ $authors->title }}
@endif
| Admin Panel - 
Thơ Văn CMS