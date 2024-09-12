@extends('backend.layouts.master')

@section('title')
    @include('service::poetry.partials.title')
@endsection

@section('admin-content')
    @include('service::poetry.partials.header-breadcrumbs')
    <div class="container-fluid">
        
        <div class="create-page">
            <form action="{{ route('admin.poetry.update', $poetries->id) }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tên Câu Thơ Random <span class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title" value="{{ $poetries->title }}" placeholder="Enter Title" required=""/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="author">Tác Giả</label>
                                    <input type="text" class="form-control" id="author" name="author"
                                        value="{{ $poetries->author }}" placeholder="Nhập Tác Giả " required="" />
                                </div>
                            </div>  
                            <div class="col-md-3">
                                <label class="control-label" for="slug">Chọn Ngày</label>
                                            <input type="date" class="form-control" id="date" name="date"
                                        value="{{ $poetries->date }}" placeholder="Chọn Ngày" required="" />
                            </div>
                            <div class="col-md-3">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $poetries->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $poetries->status === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-6">
                                <!-- <div class="form-group">
                                    <label class="control-label" for="image">Service Featured Image <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image" data-default-file="{{ $poetries->image != null ? asset('public/images/services/'.$poetries->image) : null }}"/>
                                </div> -->
                            </div>
                            <div class="col-md-6">
                                <!-- <div class="form-group">
                                    <label class="control-label" for="banner_image">Service Banner Image <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="banner_image" name="banner_image" data-default-file="{{ $poetries->banner_image != null ? asset('public/images/services/'.$poetries->banner_image) : null }}"/>
                                </div> -->
                            </div>
                        </div>


                        <div class="row ">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="description">Câu Thơ Random <span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description" name="description">{!! $poetries->description !!}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <!-- <div class="form-group">
                                    <label class="control-label" for="meta_description">Service Meta Description <span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control" id="meta_description" name="meta_description" placeholder="Meta description for SEO">{!! $poetries->meta_description !!}</textarea>
                                </div> -->
                                <div class="form-actions">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
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
