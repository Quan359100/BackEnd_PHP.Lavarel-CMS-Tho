<?php

namespace Modules\Poetry\Http\Controllers;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use Modules\Article\Entities\Category;
use App\Models\Track;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Modules\Poetry\Entities\Poetry;
use Yajra\DataTables\Facades\DataTables;
use PhpOffice\PhpWord\IOFactory;
class PoetryController extends Controller
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
     * Get random Poetry (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */

    public function getRandomPoetry(Request $request)
    {
        $limit = $request->input('limit', 1); // Lấy tham số 'limit', mặc định là 1
        $limit = min(max($limit, 1), 10); // Giới hạn giá trị 'limit' từ 1 đến 10
    
        try {
            $pages = Poetry::inRandomOrder()->limit($limit)->get();
    
            // Decode HTML entities for all fields of each page
            $decodedPages = $pages->map(function ($page) {
                foreach ($page->getAttributes() as $key => $value) {
                    // Check if the value is a string before decoding
                    if (is_string($value)) {
                        $page->$key = html_entity_decode($value, ENT_QUOTES, 'UTF-8');
                    }
                }
                return $page;
            });
    
            return response()->json([
                'status' => 'success',
                'data' => $decodedPages
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }    


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($isTrashed = false)
    {
        if (is_null($this->user) || !$this->user->can('poetry.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $poetries = Poetry::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $poetries = Poetry::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($poetries, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Câu Thơ Random Details" href="' . route('admin.poetry.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.poetry.destroy', [$row->id]);
                            if ($this->user->can('poetry.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Edit Service Details" href="' . route('admin.poetry.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('poetry.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } else {
                            $deleteRoute =  route('admin.poetry.trashed.destroy', [$row->id]);
                            $revertRoute = route('admin.poetry.trashed.revert', [$row->id]);

                            if ($this->user->can('poetry.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Service Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }



                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Câu Thơ sẽ bị xóa",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        if ($this->user->can('poetry.delete')) {
                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Câu Thơ sẽ bị xóa vĩnh viễn bạn chắc chứ ? !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Câu thơ sẽ được revert back !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
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
                        }
                        return $html;
                    }
                )

                ->editColumn('title', function ($row) {
                    return $row->title;
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
            $rawColumns = ['action', 'title', 'status', 'description', 'author'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_services = count(Poetry::select('id')->get());
        $count_active_services = count(Poetry::select('id')->where('status', 1)->get());
        $count_trashed_services = count(Poetry::select('id')->where('deleted_at', '!=', null)->get());
        return view('service::poetry.index', compact('count_services', 'count_active_services', 'count_trashed_services'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('service::poetry.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request 
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('poetry.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:services,slug',
        ]);

        try {
            DB::beginTransaction();
            $poetries = new Poetry();
            $poetries->title = $request->title;
            if ($request->slug) {
                $poetries->slug = $request->slug;
            } else {
                $poetries->slug = StringHelper::createSlug($request->title, 'Modules\Article\Entities\Page', 'slug', '-', true);
            }


            
            $poetries->status = $request->status;
            $poetries->description = $request->description;
            $poetries->author = $request->author;
            $poetries->date = $request->date;
            $poetries->created_at = Carbon::now();
            $poetries->created_by = Auth::id();
            $poetries->updated_at = Carbon::now();
            $poetries->save();

            Track::newTrack($poetries->title, 'Câu Thơ đã được tạo');
            DB::commit();
            session()->flash('success', 'Câu Thơ đã được tạo thành công !!');
            return redirect()->route('admin.poetry.index');
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
        if (is_null($this->user) || !$this->user->can('poetry.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $poetries = Poetry::find($id);
        // $categories = DB::table('categories')->select('id', 'name')->get();
        return view('service::poetry.show', compact('poetries'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('poetry.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $poetries = Poetry::find($id);
        // $categories = Category::printCategory($poetries->category_id);
        return view('service::poetry.edit', compact('poetries'));
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
        if (is_null($this->user) || !$this->user->can('poetry.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $poetries = Poetry::find($id);
        if (is_null($poetries)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.poetry.index');
        }

        $request->validate([
            'title'  => 'required|max:100'
        ]);

        try {
            DB::beginTransaction();
            $poetries->title = $request->title;
            $poetries->slug = $request->slug;
            $poetries->status = $request->status;
            $poetries->description = $request->description;
            $poetries->author = $request->author;
            $poetries->save();

            Track::newTrack($poetries->title, 'Câu Thơ đã được update!!');
            DB::commit();
            session()->flash('success', 'Câu Thơ đã được update thành công !!');
            return redirect()->route('admin.poetry.index');
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
        if (is_null($this->user) || !$this->user->can('poetry.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $poetries = Poetry::find($id);
        if (is_null($poetries)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.poetry.trashed');
        }
        $poetries->deleted_at = Carbon::now();
        $poetries->deleted_by = Auth::id();
        $poetries->status = 0;
        $poetries->save();

        session()->flash('success', 'Câu Thơ đã được xóa !!');
        return redirect()->route('admin.poetry.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('poetry.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $poetries = Poetry::find($id);
        if (is_null($poetries)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.poetry.trashed');
        }
        $poetries->deleted_at = null;
        $poetries->deleted_by = null;
        $poetries->save();

        session()->flash('success', 'Câu Thơ đã được revert back thành công !!');
        return redirect()->route('admin.poetry.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('poetry.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $poetries = Poetry::find($id);
        if (is_null($poetries)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.poetry.trashed');
        }

        // Remove Images
        UploadHelper::deleteFile('public/assets/images/services/' . $poetries->banner_image);
        UploadHelper::deleteFile('public/assets/images/services/' . $poetries->image);

        // Delete Service permanently
        $poetries->delete();

        session()->flash('success', 'Câu Thơ đã được xóa vĩnh viễn !!');
        return redirect()->route('admin.poetry.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('poetry.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
 