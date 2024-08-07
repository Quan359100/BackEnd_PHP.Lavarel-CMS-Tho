@extends('backend.layouts.master')

@section('title')
    @include('article::pages.partials.title')
@endsection

@section('admin-content')
    @include('article::pages.partials.header-breadcrumbs')
    <div class="container-fluid">
        @include('article::pages.partials.top-show')
        @include('backend.layouts.partials.messages')
        <div class="table-responsive product-table">
            <table class="table table-striped table-bordered display ajax_view" id="pages_table">
                <thead>
                    <tr>
                        <th></th>
                        <th>Tên</th>
                        <th>Phân Loại</th>
                        <th>Ảnh Trong Tác Phẩm</th>
                        <th>Tác Giả</th>
                        <th>Tag</th>
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
    const ajaxURL = "<?php echo Route::is('admin.pages.trashed' ? 'pages/trashed/view' : 'pages') ?>";
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
            {data: 'category', name: 'category'},
            {data: 'image', name: 'image'},
            {data: 'authors', name: 'authors'},
            {data: 'tag', name: 'tag'},
            {data: 'status', name: 'status'},
            {data: 'action', name: 'action'},
        ]
    });
    </script>
@endsection
