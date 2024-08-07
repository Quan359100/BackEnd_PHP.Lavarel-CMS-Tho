<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.authors.index'))
                    Danh Sách các tác giả
                @elseif(Route::is('admin.authors.create'))
                    Tạo Thông tin Tác Giả     
                @elseif(Route::is('admin.authors.edit'))
                    Sửa Thông tin Tác Giả <span class="badge badge-info">{{ $author->title }}</span>
                @elseif(Route::is('admin.authors.show'))
                    Thông tin chi tiết tác giả <span class="badge badge-info">{{ $author->title }}</span>
                    <a  class="btn btn-outline-success btn-sm" href="{{ route('admin.authors.edit', $author->id) }}"> <i class="fa fa-edit"></i></a>
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.authors.index'))
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách tác giả</li>
                        @elseif(Route::is('admin.authors.create'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.authors.index') }}">Danh Sách tác giả</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Tác Phẩm Của Tác Giả</li>
                        @elseif(Route::is('admin.authors.edit'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.authors.index') }}">Danh Sách tác giả</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sửa Các Tác Phẩm Liên Quan Tác Giả</li>
                        @elseif(Route::is('admin.authors.show'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.authors.index') }}">Danh Sách tác giả</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Show Các Tác Phẩm Liên Qua Tác Giả</li>
                        @endif
                        
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>