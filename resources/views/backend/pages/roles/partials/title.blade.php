@if (Route::is('admin.roles.index'))
Roles 
@elseif(Route::is('admin.roles.create'))
Tạo Role
@elseif(Route::is('admin.roles.edit'))
Sửa Role - {{ $role->name }}
@elseif(Route::is('admin.roles.show'))
View Role - {{ $role->name }}
@endif
| Admin Panel - 
Thơ Văn CMS