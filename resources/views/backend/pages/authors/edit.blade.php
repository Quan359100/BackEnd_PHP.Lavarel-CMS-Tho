@extends('backend.layouts.master')

@section('title')
    @include('backend.pages.authors.partials.title')
@endsection

@section('admin-content')
    @include('backend.pages.authors.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.authors.update', $author->id) }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tác Giả <span class="required">*</span></label>
                                    <select name="authors" id="authors" class="form-control custom-select" required>
                                        @foreach($authorsPage as $page)
                                            <option value="{{ $page->authors }}" {{ $page->authors === $author->authors ? 'selected' : '' }}>
                                                {{ $page->authors }}
                                             </option>
                                        @endforeach     
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $author->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $author->status === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                                                
                        <div class="row ">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="description">Thông tin Tác Giả  <span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description" name="description">{!! $author->description !!}</textarea>
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