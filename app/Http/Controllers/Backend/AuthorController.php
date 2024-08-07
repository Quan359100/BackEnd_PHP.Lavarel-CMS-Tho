<?php

namespace App\Http\Controllers\Backend;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use App\Models\Track;
use Illuminate\Http\Request;
use App\Models\Author;
use App\Models\Page;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class AuthorController extends Controller
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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($isTrashed = false)
    {
        if (is_null($this->user) || !$this->user->can('author.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $author = Author::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $author = Author::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($author, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Author Details" href="' . route('admin.authors.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.authors.destroy', [$row->id]);
                            if ($this->user->can('author.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Sửa Thông tin Tác Giả Details" href="' . route('admin.authors.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('author.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } else {
                            if ($this->user->can('author.delete')) {
                                $deleteRoute =  route('admin.authors.trashed.destroy', [$row->id]);
                                $revertRoute = route('admin.authors.trashed.revert', [$row->id]);

                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Blog Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }

                        if ($this->user->can('author.delete')) {
                            $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Thông tin tác giả sẽ bị xóa !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Thông tin tác giả sẽ bị xóa vĩnh viễn !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Thông tin tác giả sẽ được revert back  !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
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
                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/blogs/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
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
            $rawColumns = ['action', 'title', 'status', 'image'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_blogs = count(Author::select('id')->get());
        $count_active_blogs = count(Author::select('id')->where('status', 1)->get());
        $count_trashed_blogs = count(Author::select('id')->where('deleted_at', '!=', null)->get());
        return view('backend.pages.authors.index', compact('count_blogs', 'count_active_blogs', 'count_trashed_blogs'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (is_null($this->user) || !$this->user->can('author.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $authorsPage = Page::select('authors')->distinct()->get();

        return view('backend.pages.authors.create',compact('authorsPage'));
    }

    // /**
    //  * get Author from Page
    //  *
    //  * @return \Illuminate\Http\Response
    //  */
    // public function getAuthors()
    // {
    //     // Lấy danh sách các tác giả từ bảng pages
    //     ;

    //     return view('link_related_to_authors.create', compact('authors'));
    // }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('author.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            'authors' => 'required|string|in:' . Page::select('authors')->distinct()->pluck('authors')->implode(','),
        ]);

        try {
            DB::beginTransaction();
            $author = new Author();
            if (!is_null($request->image)) {
                $author->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/blogs');
            }

            $author->status = $request->status;
            $author->authors = $request->authors;
            $author->description = $request->description;
            $author->created_at = Carbon::now();
            $author->created_by = Auth::id();
            $author->updated_at = Carbon::now();
            $author->save();

            //Track::newTrack($author->title, 'New Blog has been created');
            DB::commit();
            session()->flash('success', 'New author has been created successfully !!');
            return redirect()->route('admin.authors.index');
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
        if (is_null($this->user) || !$this->user->can('author.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $author = Author::find($id);
        return view('backend.pages.authors.show', compact('author'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('author.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $author = Author::find($id);
        $authorsPage = Page::select('authors')->distinct()->get();
        return view('backend.pages.authors.edit', compact('author', 'authorsPage'));
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
        if (is_null($this->user) || !$this->user->can('author.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $author = Author::find($id);
        if (is_null($author)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.authors.index');
        }

        $request->validate([
            'authors' => 'required|string|in:' . Page::select('authors')->distinct()->pluck('authors')->implode(','),
        ]);

        try {
            DB::beginTransaction();



            if (!is_null($request->image)) {
                $author->image = UploadHelper::update('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/blogs', $author->image);
            }

            $author->authors = $request->authors;
            $author->status = $request->status;
            $author->description = $request->description;
            $author->updated_by = Auth::id();
            $author->updated_at = Carbon::now();
            $author->save();

            //Track::newTrack($author->title, 'Thông tin tác giả has been updated successfully !!');
            DB::commit();
            session()->flash('success', 'Thông tin tác giả has been updated successfully !!');
            return redirect()->route('admin.authors.index');
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
        if (is_null($this->user) || !$this->user->can('author.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $author = Author::find($id);
        if (is_null($author)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.authors.trashed');
        }
        $author->deleted_at = Carbon::now();
        $author->deleted_by = Auth::id();
        $author->status = 0;
        $author->save();

        session()->flash('success', 'Blog has been deleted successfully as trashed !!');
        return redirect()->route('admin.authors.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('author.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $author = Author::find($id);
        if (is_null($author)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.authors.trashed');
        }
        $author->deleted_at = null;
        $author->deleted_by = null;
        $author->save();

        session()->flash('success', 'Blog has been revert back successfully !!');
        return redirect()->route('admin.authors.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('author.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $author = Author::find($id);
        if (is_null($author)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.authors.trashed');
        }

        // Remove Image
        UploadHelper::deleteFile('public/assets/images/blogs/' . $author->image);

        // Delete Blog permanently
        $author->delete();

        session()->flash('success', 'Thông tin tác giả has been deleted permanently !!');
        return redirect()->route('admin.authors.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('author.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
