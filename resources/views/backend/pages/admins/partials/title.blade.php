@if (Route::is('admin.admins.index'))
Users
@elseif(Route::is('admin.admins.create'))
Tạo User Mới
@elseif(Route::is('admin.admins.edit'))
Sửa User Mới - {{ $admin->first_name }}
@elseif(Route::is('admin.admins.profile.edit'))
Sửa Profile - {{ $admin->first_name }}
@endif
| User Panel -
Thơ Văn CMS
