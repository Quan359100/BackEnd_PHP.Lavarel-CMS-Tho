<div class="page-breadcrumb">
    <div class="row">
        <div class="col-5 align-self-center">
            <h4 class="page-title">
                @if (Route::is('admin.poetry.index'))
                    Danh Sách Câu Thơ
                @elseif(Route::is('admin.poetry.create'))
                    Tạo Câu Thơ Random
                @elseif(Route::is('admin.poetry.edit'))
                    Edit Service <span class="badge badge-info">{{ $poetries->title }}</span>
                @elseif(Route::is('admin.poetry.show'))
                    View Câu Thơ Random <span class="badge badge-info">{{ $poetries->title }}</span>
                    <a  class="btn btn-outline-success btn-sm" href="{{ route('admin.poetry.edit', $poetries->id) }}"> <i class="fa fa-edit"></i></a>
                @endif
            </h4>
        </div>
        <div class="col-7 align-self-center">
            <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ route('admin.index') }}">Home</a></li>
                        @if (Route::is('admin.poetry.index'))
                            <li class="breadcrumb-item active" aria-current="page">List Câu Thơ Random</li>
                        @elseif(Route::is('admin.poetru.create'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.poetry.index') }}">List Câu Thơ Random</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Tạo Câu Thơ Random</li>
                        @elseif(Route::is('admin.poetry.edit'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.poetry.index') }}">List Câu Thơ Random</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Sửa Câu Thơ Random</li>
                        @elseif(Route::is('admin.poetry.show'))
                        <li class="breadcrumb-item"><a href="{{ route('admin.poetry.index') }}">List Câu Thơ Random</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Thông tin Câu Thơ Random</li>
                        @endif

                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
