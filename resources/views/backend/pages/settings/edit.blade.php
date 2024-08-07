@extends('backend.layouts.master')

@section('title')
    @include('backend.pages.settings.partials.title')
@endsection

@section('admin-content')
    @include('backend.pages.settings.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('backend.layouts.partials.messages')
        <div class="create-page">
            <form action="{{ route('admin.settings.update') }}" method="POST" enctype="multipart/form-data"
                data-parsley-validate data-parsley-focus="first">
                @csrf
                @method('put')

                <div class="form-body">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                    <a class="nav-link active" id="v-pills-general-tab" data-toggle="pill" href="#v-pills-general" role="tab" aria-controls="v-pills-general" aria-selected="true">
                                        <i class="fa fa-th"></i> General
                                    </a>
                                    <a class="nav-link" id="v-pills-api-tab" data-toggle="pill" href="#v-pills-api" role="tab" aria-controls="v-pills-api" aria-selected="false">
                                        <i class="fa fa-plug"></i> API Config
                                    </a>
                                    <a class="nav-link" id="v-pills-layout-tab" data-toggle="pill" href="#v-pills-layout" role="tab" aria-controls="v-pills-layout" aria-selected="false">
                                        <i class="fa fa-cogs"></i> Layout Config
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-9">
                                <div class="tab-content" id="v-pills-tabContent">
                                    <div class="tab-pane fade show active" id="v-pills-general" role="tabpanel" aria-labelledby="v-pills-general-tab">
                                        @include('backend.pages.settings.partials.general-settings')
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-api" role="tabpanel" aria-labelledby="v-pills-social-tab">
                                        @include('backend.pages.settings.partials.api-settings')
                                    </div>
                                    <div class="tab-pane fade" id="v-pills-layout" role="tabpanel" aria-labelledby="v-pills-layout-tab">
                                        @include('backend.pages.settings.partials.layout-settings')
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-success">
                                    <i class="fa fa-check"></i> Save
                                </button>
                                <a href="{{ route('admin.settings.index') }}" class="btn btn-dark">
                                    Cancel
                                </a>
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
        $('[data-toggle="tooltip"]').tooltip();
    </script>
@endsection
