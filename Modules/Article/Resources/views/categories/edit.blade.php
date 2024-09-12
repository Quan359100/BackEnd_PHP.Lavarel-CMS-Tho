@extends('backend.layouts.master')

@section('title')
    @include('article::categories.partials.title')
@endsection

@section('admin-content')
    @include('article::categories.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.categories.update', $category->id) }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="name">Tên Phân Loại <span class="required">*</span></label>
                                    <input type="text" class="form-control" id="name" name="name" value="{{ $category->name }}" placeholder="Enter Category Name" required=""/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="slug">URL Tắt <span class="required">*</span></label>
                                    <input type="text" class="form-control" id="slug" name="slug" value="{{ $category->slug }}" placeholder="Enter short url (Keep blank to auto generate)" />
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="priority">Thứ Tự Hiển Thị Trên Website <span class="optional">(optional)</span></label>
                                    <input type="number" class="form-control" id="priority" name="priority" value="{{ $category->priority }}" placeholder="Enter Display Order (Lower=Higher); eg-1" min="0"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $category->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $category->status === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="image">Banner Ảnh <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="banner_image" name="banner_image" data-default-file="{{ $category->banner_image != null ? asset('public/assets/images/category/'.$category->banner_image) : null }}"/>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="description">Miêu Tả Phân Loại <span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_simple" id="description" name="description">{!! $category->description !!}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                            <div class="form-actions">
                                <div class="card-body">
                                    <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
                                    <a href="{{ route('admin.categories.index') }}" class="btn btn-dark">Cancel</a>
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
@include('article::categories.partials.scripts')
@endsection
