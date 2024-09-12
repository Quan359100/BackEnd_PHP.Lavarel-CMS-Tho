@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    @include('article::pages.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.pages.update', $page->id) }}" method="POST" enctype="multipart/form-data" data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tên Tác Phẩm <span class="required">*</span></label>
                                    <input type="text" class="form-control" id="title" name="title" value="{{ $page->title }}" placeholder="Enter Title" required=""/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="slug">Short URL <span class="optional">(optional)</span></label>
                                    <input type="text" class="form-control" id="slug" name="slug" value="{{ $page->slug }}" placeholder="Enter short url (Keep blank to auto generate)" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status <span class="required">*</span></label>
                                    <select class="form-control custom-select" id="status" name="status" required>
                                        <option value="1" {{ $page->status === 1 ? 'selected' : null }}>Active</option>
                                        <option value="0" {{ $page->status === 0 ? 'selected' : null }}>Inactive</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="category_id">Category Tác Phẩm <span class="optional">(optional)</span></label>
                                    <br>
                                    <select class="form-control custom-select" id="category_id" name="category_id" style="width: 100%;">
                                        @foreach ($categories as $category)
                                            <option value="{{ $category->id }}" {{ $page->category_id == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="tags">Tags <span class="optional">(optional)</span></label>
                                    <input type="text" class="form-control" id="inputField" placeholder="Enter tag and press Enter"/>
                                    <div class="tags" id="tagsContainer">
                                        @foreach ($page->tags as $tag)
                                            <div class="tag">
                                                {{ $tag }}
                                                <input type="hidden" name="tags[]" value="{{ $tag }}">
                                                <button type="button" class="remove-tag">&times;</button>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="image">Ảnh Trong Tác Phẩm <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="image" name="image" data-default-file="{{ $page->image != null ? asset('public/assets/images/pages/'.$page->image) : null }}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label class="control-label" for="banner_image">Banner Ảnh <span class="optional">(optional)</span></label>
                                    <input type="file" class="form-control dropify" data-height="70" data-allowed-file-extensions="png jpg jpeg webp" id="banner_image" name="banner_image" data-default-file="{{ $page->banner_image != null ? asset('public/assets/images/pages/'.$page->banner_image) : null }}"/>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label" for="authors">Tác Giả <span class="required">*</span></label>
                                <input type="text" class="form-control" id="authors" name="authors" value="{{ $page->authors }}" placeholder="Enter Author" required=""/>
                            </div>
                        </div>

                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="description">Nội Dung Tác Phẩm<span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="description" name="description">{!! $page->description !!}</textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="short_description">Lời Giới Thiệu<span class="optional">(optional)</span></label>
                                    <textarea type="text" class="form-control tinymce_advance" id="short_description" name="short_description">{!! $page->short_description !!}</textarea>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Save</button>
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

                    const removeButton = document.createElement('button');
                    removeButton.type = 'button';
                    removeButton.className = 'remove-tag';
                    removeButton.innerHTML = '&times;';
                    removeButton.addEventListener('click', function() {
                        tagsContainer.removeChild(newTag);
                    });

                    newTag.appendChild(removeButton);

                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'tags[]';
                    hiddenInput.value = tagText;

                    newTag.appendChild(hiddenInput);
                    tagsContainer.appendChild(newTag);

                    inputField.value = '';  // Clear the input field
                }
            }
        });

        document.querySelectorAll('.remove-tag').forEach(button => {
            button.addEventListener('click', function() {
                const tag = button.parentElement;
                tag.parentElement.removeChild(tag);
            });
        });
    </script>
    <style>
        .tags {
            display: flex;
            flex-wrap: wrap;
            gap: 5px;
            margin-top: 20px;
        }
        .tag {
            background-color: gray;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }
        .remove-tag {
            background: none;
            border: none;
            color: white;
            margin-left: 10px;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
@endsection