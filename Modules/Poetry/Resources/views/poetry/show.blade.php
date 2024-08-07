@extends('backend.layouts.master')

@section('title')
    @include('service::poetry.partials.title')
@endsection

@section('admin-content')
    @include('service::poetry.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
                <div class="form-body">
                    <div class="card-body">
                        <div class="row ">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label" for="title">Tên Câu Thơ Random</label>
                                    <br>
                                    {{ $poetries->title }}
                                </div>
                            </div>
                            <div class="col-md-6">
                            <label class="control-label" for="title">Ngày</label>
                                    <br>
                                    {{ $poetries->date }}                                
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-6">
                                <div class="form-group has-success">
                                    <label class="control-label" for="status">Status</label>
                                    <br>
                                    {{ $poetries->status === 1 ? 'Active' : 'Inactive' }}
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="control-label" for="description">Câu Thơ Random</label>
                                    <div>
                                        {!! $poetries->description !!}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-actions">
                                    <div class="card-body">
                                        @if (Auth::user()->can('page.edit'))
                                            <a  class="btn btn-success" href="{{ route('admin.poetry.edit', $poetries->id) }}"> <i class="fa fa-edit"></i> Edit Now</a>
                                        @endif
                                        <a href="{{ route('admin.poetry.index') }}" class="btn btn-dark ml-2">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
