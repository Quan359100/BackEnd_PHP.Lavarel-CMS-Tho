<?php

namespace Modules\Article\Http\Controllers;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use App\Models\Track;
use Illuminate\Http\Request;
use Modules\Article\Entities\Category;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class CategoriesController extends Controller
{

    public $user;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }


    /**
     * Get a list of categories.(API)
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function getCategories()
    {
        try {
            $categories = Category::where('status', 1) // Lấy các danh mục hoạt động
                ->whereNull('deleted_at') // Loại trừ các danh mục đã bị xóa (soft delete)
                ->orderBy('priority', 'asc')
                ->get(['id', 'name', 'slug']); // Chỉ lấy các trường cần thiết
    
            // Decode HTML entities cho các trường có dữ liệu dạng chuỗi
            $decodedCategories = $categories->map(function ($category) {
                foreach ($category->getAttributes() as $key => $value) {
                    // Kiểm tra liệu giá trị có phải là chuỗi không trước khi decode
                    if (is_string($value)) {
                        $category->$key = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
                    }
                }
                return $category;
            });
    
            return response()->json([
                'success' => true,
                'categories' => $decodedCategories
            ]);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($isTrashed = false)
    {

        if ( is_null($this->user) || ! $this->user->can('category.view') ) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $categories = Category::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $categories = Category::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($categories, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = "";

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.categories.destroy', [$row->id]);
                            if( $this->user->can('category.edit')) {
                                $html = '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle" title="Sửa Phân LoạiDetails" href="' . route('admin.categories.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if( $this->user->can('category.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-2 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } elseif($this->user->can('category.delete')) {
                            $deleteRoute =  route('admin.categories.trashed.destroy', [$row->id]);
                            $revertRoute = route('admin.categories.trashed.revert', [$row->id]);

                            $html = '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                            $html .= '
                            <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Revert</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';
                            $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-2 text-white" title="Delete Category Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                        }



                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Phân Loại sẽ bị xóa , bạn có chắc không?!",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Phân Loại sẽ bị xóa vĩnh viễn, cả hai đều khỏi thùng rác!",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Category will be revert back from trash !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
                                }).then((result) => { if (result.value) {$("#revertForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        $html .= '
                            <form id="deleteForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';

                        $html .= '
                            <form id="deletePermanentForm' . $row->id . '" action="' . $deleteRoute . '" method="post" style="display:none">' . $csrf . $method_delete . '
                                <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                        class="fa fa-check"></i> Confirm Permanent Delete</button>
                                <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                        class="fa fa-times"></i> Cancel</button>
                            </form>';
                        return $html;
                    }
                )

                ->editColumn('name', function ($row) {
                    return $row->name;
                    // . ' <br /><a href="' . route('category.show', $row->slug) . '" target="_blank"><i class="fa fa-link"></i> View</a>';
                })

                ->editColumn('status', function ($row) {
                    if ($row->status) {
                        return '<span class="badge badge-success font-weight-100">Active</span>';
                    } else if ($row->deleted_at != null) {
                        return '<span class="badge badge-danger">Trashed</span>';
                    } else {
                        return '<span class="badge badge-warning">Inactive</span>';
                    }
                });
            $rawColumns = ['action', 'name', 'status', 'priority'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_categories = count(Category::select('id')->get());
        $count_active_categories = count(Category::select('id')->where('status', 1)->get());
        $count_trashed_categories = count(Category::select('id')->where('deleted_at', '!=', null)->get());
        return view('article::categories.index', compact('count_categories', 'count_active_categories', 'count_trashed_categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('article::categories.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('category.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            'name'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:categories,slug',
        ]);

        try {
            DB::beginTransaction();
            $category = new Category();
            $category->name = $request->name;
            if ($request->slug) {
                $category->slug = $request->slug;
            } else {
                $category->slug = StringHelper::createSlug($request->name, 'Modules\Article\Entities\Category', 'slug', '-', true);
            }
            $category->status = $request->status;
            $category->description = $request->description;
            $category->priority = $request->priority ? $request->priority : 1;
            $category->created_at = Carbon::now();
            $category->created_by = Auth::id();
            $category->updated_at = Carbon::now();
            $category->save();

            // Update priority column
            if(!$request->priority){
                $category->priority = $category->id;
                $category->save();
            }

            $data = [
                'category' => $category->id,
                'en' => $category->name,
                'key' => $category->slug
            ];

            Track::newTrack($category->name, 'Phân Loại mới được tạo');
            DB::commit();
            session()->flash('success', 'Phân Loại mới được tạo thành công !!');
            return redirect()->route('admin.categories.index');
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('category.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $category   = Category::find($id);
        return view('article::categories.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (is_null($this->user) || !$this->user->can('category.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $category = Category::find($id);
        if (is_null($category)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.categories.index');
        }

        $request->validate([
            'name'  => 'required|max:100',
            'slug'  => 'required|max:100|unique:categories,slug,' . $category->id,
        ]);

        try {
            DB::beginTransaction();
            $category->name = $request->name;
            $category->slug = $request->slug;
            $category->status = $request->status;
            $category->description = $request->description;
            $category->priority = $request->priority;
            $category->updated_by = Auth::id();
            $category->updated_at = Carbon::now();
            $category->save();

            // Update priority column
            if(!$request->priority){
                $category->priority = $category->id;
                $category->save();
            }

            $data = [
                'category' => $category->id,
                'en' => $category->name,
                'key' => $category->slug
            ];

            Track::newTrack($category->slug, 'Phân Loại đã được tạo!!');
            DB::commit();
            session()->flash('success', 'Phân Loại đã tạo thành công !!');
            return redirect()->route('admin.categories.index');
        } catch (\Exception $e) {
            session()->flash('sticky_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (is_null($this->user) || !$this->user->can('category.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $category = Category::find($id);
        if (is_null($category)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.categories.trashed');
        }
        $category->deleted_at = Carbon::now();
        $category->deleted_by = Auth::id();
        $category->status = 0;
        $category->save();

        session()->flash('success', 'Phân Loại đã xóa thành công !!');
        return redirect()->route('admin.categories.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('category.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $category = Category::find($id);
        if (is_null($category)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.categories.trashed');
        }
        $category->deleted_at = null;
        $category->deleted_by = null;
        $category->save();

        session()->flash('success', 'Phân loại đẫ được hồi phục!!');
        return redirect()->route('admin.categories.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('category.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $category = Category::find($id);
        if (is_null($category)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.categories.trashed');
        }

        // Remove Images
        UploadHelper::deleteFile('public/assets/images/categorys/' . $category->banner_image);
        UploadHelper::deleteFile('public/assets/images/categorys/' . $category->image);

        // Delete Category permanently
        $category->delete();

        session()->flash('success', 'Phân loại đã bị xóa Phân Loại đã bị xóa vĩnh viễn, !!');
        return redirect()->route('admin.categories.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('category.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
