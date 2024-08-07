@extends('frontend.layouts.master')

@section('title')
    Thơ Văn CMS | {{ config('app.description') }}
@endsection

@section('main-content')

<main class="main">

  <!-- Page Content -->
    <div class="main-header">
        <div class="container">
            <h1 class="display-4">Chào mừng {{ $settings->general->name }}</h1>
                <p class="lead">
                    Hệ Thống Quản Lý CMS Thơ Văn
                </p>
            <a href="{{ route('admin.login') }}" class="btn btn-primary btn-lg" style = "margin-bottom: 280px">Đăng Nhập</a>
    <!-- /.container -->
        </div>        
    </div>

    <!-- Xoa di -->
    <!-- <div class="container mt-5">
        <h1 class="display-4">Get Frontend Themes</h1>
        <div class="row justify-content-center">
            <div class="card card-body col-sm-12 col-md-3 col-lg-4">
                <h4 class="mb-3">Business Website</h4>
                <a href="{{ route('demo.business.index') }}" class="btn btn-info">
                    Go ››
                </a>
            </div>
        </div> 
    </div> -->
    <!-- /.container -->
  <!-- </div> -->
</main>

@endsection
