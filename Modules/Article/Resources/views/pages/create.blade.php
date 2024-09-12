@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    @include('article::pages.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.pages.store') }}" method="POST" enctype="multipart/form-data"
                data-parsley-validate data-parsley-focus="first">
                @csrf
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tên Tác Phẩm <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title"
                                        value="{{ old('title') }}" placeholder="Enter Title" required="" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="slug">Ngaỳ Phát Hành <span class="required">*</span></label>
                                    <input type="date" class="form-control" id="pub_date" name="pub_date"
                                    value="" placeholder="Chọn Ngày" required="" />        
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="category_id">Phân Loại<span
                                            class="optional">(optional)</span></label>
                                    <br>

                                    <select name="category_id" id="category_id"  class="form-control custom-select" >
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="article_type_id">Tag <span
                                            class="optional">(optional)</span></label>
                                    <br>
                                    <input type="text" class="form-control" id="inputField" value="" placeholder="Enter tag and press Enter"/>
                                    <div class="tags" id="tagsContainer"></div>                                  
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ old('status') === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ old('status') === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row ">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="image">Ảnh Trong Tác Phẩm <span
                                            class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70"
                                        data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image"
                                        value="{{ old('image') }}"  />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="image">Ảnh Banner <span
                                            class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70"
                                        data-allowed-file-extensions="png jpg jpeg webp" id="banner_image" name="banner_image"
                                        value="{{ old('banner_image') }}" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                 <div class="form-group">
                                    <label class="control-label" for="authors">Tác Giả <span
                                            class="required">*</span></label>
                                    <input type="text" class="form-control" id="authors" name="authors"
                                        value="{{ old('authors') }}" placeholder="Enter Author" required="" />
                                </div>
                            </div>
                        </div>


                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="description">Nội Dung Tác Phẩm<span
                                            class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description"
                                        name="description" value="{{ old('description') }}"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="short_description">Lời Giới Thiệu<span
                                            class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="short_description"
                                        name="short_description" value="{{ old('short_description') }}"></textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i>
                                            Save</button>
                                        <a href="{{ route('admin.pages.index') }}" class="btn btn-dark">Cancel</a>
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
        document.getElementById('inputField').addEventListener('keydown', function(event) {
            if (event.key === 'Enter') {
                event.preventDefault();  // Prevent the default action of Enter key

                const inputField = document.getElementById('inputField');
                const tagsContainer = document.getElementById('tagsContainer');
                const tagText = inputField.value.trim();
                const currentTags = tagsContainer.getElementsByClassName('tag');

                if (tagText !== '' && currentTags.length < 5) {
                    const newTag = document.createElement('div');
                    newTag.className = 'tag';
                    newTag.textContent = tagText;
                    tagsContainer.appendChild(newTag);

                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'tags[]';
                    hiddenInput.value = tagText;
                    tagsContainer.appendChild(hiddenInput);

                    inputField.value = '';  // Clear the input field
                }
            }
        });   
    </script>
        <style>
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin-top: 20px; /* Increase margin-top */
        }
        .tag {
            background-color: gray; /* Change tag color to gray */
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
        }
    </style>
@endsection
