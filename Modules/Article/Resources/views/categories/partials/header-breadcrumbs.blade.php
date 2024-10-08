<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.categories.index'))
                    Danh Sách Phân Loại
                @elseif(Route::is('admin.categories.create'))
                    Tạo Phân Loại Mới    
                @elseif(Route::is('admin.categories.edit'))
                    Sửa Phân Loại<span class="badge badge-info">{{ $category->name }}</span>
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.categories.index'))
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Phân Loại</li>
                        @elseif(Route::is('admin.categories.create'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.categories.index') }}">Danh Sách Phân Loại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Phân Loại Mới</li>
                        @elseif(Route::is('admin.categories.edit'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.categories.index') }}">Danh Sách Phân Loại</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Category</li>
                        @endif
                        
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>