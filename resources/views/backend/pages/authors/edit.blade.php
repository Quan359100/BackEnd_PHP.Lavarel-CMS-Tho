@extends('backend.layouts.master')

@section('title')
    @include('backend.pages.authors.partials.title')
@endsection

@section('admin-content')
    @include('backend.pages.authors.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.authors.update', $authors->id) }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="authors">Tác Giả <span class="required">*</span></label>
                                    <select name="authors" id="authors" class="form-control custom-select" required>
                                        @foreach($authorsPage as $page)
                                            <option value="{{ $page->authors }}" {{ $page->authors === $authors->authors ? 'selected' : '' }}>
                                                {{ $page->authors }}
                                             </option>
                                        @endforeach     
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="face_url">Facebook URL <span class="optional">(optional)</span></label>
                                    <input type="text" class="form-control" id="face_url" name="face_url" value="{{ $authors->face_url }}" placeholder="Enter Facebook URL" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="x_url">X URL <span class="optional">(optional)</span></label>
                                    <input type="text" class="form-control" id="x_url" name="x_url" value="{{ $authors->x_url }}" placeholder="Enter X URL" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="optional">(optional)</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $authors->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $authors->status === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                                                
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="description">Thông tin Tác Giả  <span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description" name="description">{!! $authors->description !!}</textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="image">Ảnh Tác Giả <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image" data-default-file="{{ $page->image != null ? asset('public/assets/images/pages/'.$page->image) : null }}"/>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
                                        <a href="{{ route('admin.authors.index') }}" class="btn btn-dark">Cancel</a>
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