@extends('backend.layouts.master')

@section('title')
    @include('service::poetry.partials.title')
@endsection

@section('admin-content')
    @include('service::poetry.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('service::poetry.partials.top-show')
        @include('backend.layouts.partials.messages')
        <div class="table-responsive product-table">
            <table class="table table-striped table-bordered display ajax_view" id="pages_table">
                <thead>
                    <tr>
                        <th></th>
                        <th>Tên Câu Thơ Random</th>
                        <th>Status</th>
                        <th width="100">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
    const ajaxURL = "<?php echo Route::is('admin.poetry.trashed' ? 'pages/trashed/view' : 'pages') ?>";
    $('table#pages_table').DataTable({
        dom: 'Blfrtip',
        language: {processing: "<span class='spinner-border spinner-border-sm' role='status' aria-hidden='true'></span> Loading Data..."},
        processing: true,
        serverSide: true,
        ajax: {url: ajaxURL},
        aLengthMenu: [[25, 50, 100, 1000, -1], [25, 50, 100, 1000, "All"]],
        buttons: ['excel', 'pdf', 'print'],
        columns: [
            {data: 'DT_RowIndex', name: 'DT_RowIndex'},
            {data: 'title', name: 'title'},
            // {data: 'category', name: 'category'},
            // {data: 'image', name: 'image'},
            // {data: 'banner_image', name: 'banner_image'},
            {data: 'status', name: 'status'},
            {data: 'action', name: 'action'}
        ]
    });
    </script>
@endsection
