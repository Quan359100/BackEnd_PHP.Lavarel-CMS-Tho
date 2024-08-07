<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.pages.index'))
                    Danh Sách Tác Phẩm
                @elseif(Route::is('admin.pages.create'))
                    Tạo Tác Phẩm
                @elseif(Route::is('admin.pages.edit'))
                    Edit Article/Page <span class="badge badge-info">{{ $page->title }}</span>
                @elseif(Route::is('admin.pages.show'))
                    View Article/Page <span class="badge badge-info">{{ $page->title }}</span>
                    <a  class="btn btn-outline-success btn-sm" href="{{ route('admin.pages.edit', $page->id) }}"> <i class="fa fa-edit"></i></a>
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.pages.index'))
                            <li class="breadcrumb-item active" aria-current="page">Danh Sách Tác Phẩm</li>
                        @elseif(Route::is('admin.pages.create'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.pages.index') }}">Danh Sách Tác Phẩm</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Tác Phẩm</li>
                        @elseif(Route::is('admin.pages.edit'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.pages.index') }}">Danh Sách Tác Phẩm</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit Article/Page</li>
                        @elseif(Route::is('admin.pages.show'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.pages.index') }}">Danh Sách Tác Phẩm</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Show Article/Page</li>
                        @endif

                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
