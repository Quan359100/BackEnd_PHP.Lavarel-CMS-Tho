
<!-- ============================================================== -->
<!-- Top Show Data of Categorie List Service -->
<!-- ============================================================== -->
<div class="row mt-1">
    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer"  onclick="location.href='{{ route('admin.poetry.index') }}'">
        <div class="card card-hover">
            <div class="box bg-info text-center">
                <h1 class="font-light text-white">{{ $count_services }}</h1>
                <h6 class="text-white">Tổng số Câu Thơ Random</h6>
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer"  onclick="location.href='{{ route('admin.poetry.index') }}'">
        <div class="card card-hover">
            <div class="box bg-success text-center">
                <h1 class="font-light text-white">{{ $count_active_services }}</h1> 
                <h6 class="text-white">Câu Thơ Random Đang Active</h6>
            </div>
        </div>
    </div>

    <!-- Column -->
    <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.poetry.trashed') }}'">
        <div class="card card-hover">
            <div class="box bg-primary text-center">
                <h1 class="font-light text-white">{{ $count_services - $count_active_services }} / {{ $count_trashed_services }} </h1>
                <h6 class="text-white">Inactive/Trashed Câu Thơ Random</h6>
            </div>
        </div>
    </div>

    <!-- Column -->
    @if (Auth::user()->can('poetry.create'))
        <div class="col-md-6 col-lg-3 col-xlg-3 pointer" onclick="location.href='{{ route('admin.poetry.create') }}'">
            <div class="card card-hover">
                <div class="box bg-info text-center">
                    <h1 class="font-light text-white">
                        <i class="fa fa-plus-circle"></i>
                    </h1>
                    <h6 class="text-white">Tạo Câu Thơ Random</h6>
                </div>
            </div>
        </div>
    @endif

</div>
