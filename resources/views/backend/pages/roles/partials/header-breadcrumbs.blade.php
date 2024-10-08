<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.roles.index'))
                    Role List (Chức năng đang được sửa lại xin đừng dùng nó)
                @elseif(Route::is('admin.roles.create'))
                    Create New Role (Chức Năng Này Đang Sửa Lại Xin Đừng DÙng Nó)    
                @elseif(Route::is('admin.roles.edit'))
                    Edit Role <span class="badge badge-info">{{ $role->name }}</span>
                @elseif(Route::is('admin.roles.show'))
                    View Role <span class="badge badge-info">{{ $role->name }}</span>
                    <a  class="btn btn-outline-success btn-sm" href="{{ route('admin.roles.edit', $role->id) }}"> <i class="fa fa-edit"></i></a>
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.roles.index'))
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Role</li>
                        @elseif(Route::is('admin.roles.create'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.roles.index') }}">Danh Sách Role</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Role Mới</li>
                        @elseif(Route::is('admin.roles.edit'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.roles.index') }}">Danh Sách Role</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sửa Role</li>
                        @elseif(Route::is('admin.roles.show'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.roles.index') }}">Danh Sách Role</a></li>
                        <li class="breadcrumb-item active" aria-current="page">View Role</li>
                        @endif
                        
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>