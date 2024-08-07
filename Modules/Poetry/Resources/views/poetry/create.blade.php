@extends('backend.layouts.master')

@section('title')
    @include('service::poetry.partials.title')
@endsection

@section('admin-content')
    @include('service::poetry.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.poetry.store') }}" method="POST" enctype="multipart/form-data"
                data-parsley-validate data-parsley-focus="first">
                @csrf
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tên Câu Thơ Random <span class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="{{ old('title') }}" placeholder="Nhập Tên Câu Thơ Random" required="" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="date">Chọn Ngày</label>
                                    <input type="date" class="form-control" id="date" name="date"
                                        value="{{ old('date') }}" placeholder="Chọn Ngày" required="" />
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ old('status') === '1' ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ old('status') === '0' ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="description">Câu Thơ Random <span class="optional"></span></label>
                                    <textarea class="form-control tinymce_advance" id="description" name="description" required>{{ old('description') }}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Save</button>
                                        <a href="{{ route('admin.poetry.index') }}" class="btn btn-dark">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(".categories_select").select2({
            placeholder: "Select a Category"
        });
    </script>
@endsection
