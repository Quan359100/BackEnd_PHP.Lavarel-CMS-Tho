<?php

namespace Modules\Article\Http\Controllers;

use App\Helpers\StringHelper;
use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use Modules\Article\Entities\ArticleType;
use Modules\Article\Entities\Category;
use App\Models\Track;
use Illuminate\Http\Request;
use Modules\Article\Entities\Page;
use Modules\Poetry\Entities\Poetry;
use App\Models\Author;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class PagesController extends Controller
{
    public $user;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }


    /** API Function */
    /**
     * Get Search (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        $request->validate([
            'keyword' => 'required|string|max:20',
            'limit' => 'required|integer',
            'offset' => 'required|integer',
        ]);
    
        try {
            $keyword = $request->input('keyword');
            $limit = $request->input('limit');
            $offset = $request->input('offset');
    
            // Search in the Page (article) table
            $articles = Page::where('title', 'like', "%{$keyword}%")
                ->orWhere('description', 'like', "%{$keyword}%")
                ->select('id', 'title', 'description')
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($article) {
                    $article->title = html_entity_decode($article->title, ENT_QUOTES, 'UTF-8');
                    $article->description = html_entity_decode($article->description, ENT_QUOTES, 'UTF-8');
                    return $article;
                });
    
            $totalArticles = Page::where('title', 'like', "%{$keyword}%")
                ->orWhere('description', 'like', "%{$keyword}%")
                ->count();
    
            // Search in the Author table
            $authors = Author::where('description', 'like', "%{$keyword}%")
                ->select('id', 'description')
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($author) {
                    $author->description = html_entity_decode($author->description, ENT_QUOTES, 'UTF-8');
                    return $author;
                });
    
            $totalAuthors = Author::where('description', 'like', "%{$keyword}%")
                ->count();
    
            // Random search in the Poetry table
            $poetries = Poetry::inRandomOrder()
                ->where('title', 'like', "%{$keyword}%")
                ->orWhere('description', 'like', "%{$keyword}%")
                ->select('id', 'title', 'description')
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($poetry) {
                    $poetry->title = html_entity_decode($poetry->title, ENT_QUOTES, 'UTF-8');
                    $poetry->description = html_entity_decode($poetry->description, ENT_QUOTES, 'UTF-8');
                    return $poetry;
                });
    
            $totalPoetries = Poetry::where('title', 'like', "%{$keyword}%")
                ->orWhere('description', 'like', "%{$keyword}%")
                ->count();
    
            // Compile data
            $data = [
                'articles' => $articles,
                'authors' => $authors,
                'poetries' => $poetries,
            ];
    
            // Total records
            $total = $totalArticles + $totalAuthors + $totalPoetries;
    
            return response()->json([
                'status' => 'success',
                'data' => $data,
                'total' => $total,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage(),
            ], 500);
        }
    }
    

     
    /**
     * Get random pages (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function getRandomPages(Request $request)
    {
        $limit = $request->input('limit', 1); // Lấy tham số 'limit', mặc định là 1
        $limit = min(max($limit, 1), 10); // Giới hạn giá trị 'limit' từ 1 đến 10
    
        try {
            $pages = Page::inRandomOrder()->limit($limit)->get();
    
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
     * Get list of pages by category with pagination and ordering (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
    */
    public function getPageCategory(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
            'limit' => 'required|integer',
            'offset' => 'required|integer',
            'ordering' => 'required|in:date,abc,pubdate',
        ]);
    
        try {
            $categoryId = $request->input('id');
            $limit = $request->input('limit');
            $offset = $request->input('offset');
            $ordering = $request->input('ordering');
    
            // Validate and set ordering criteria
            switch ($ordering) {
                case 'date':
                    $orderBy = 'created_at';
                    break;
                case 'abc':
                    $orderBy = 'title';
                    break;
                case 'pubdate':
                    $orderBy = 'pub_date';
                    break;
                default:
                    $orderBy = 'created_at';
            }
    
            // Query pages by category with pagination and ordering
            $pages = Page::select('id', 'title') // Including 'id' in the select
                ->where('category_id', $categoryId)
                ->orderBy($orderBy)
                ->offset($offset)
                ->limit($limit)
                ->get();
    
            // Decode HTML entities in the 'title' field
            $decodedPages = $pages->map(function ($page) {
                $page->title = html_entity_decode($page->title, ENT_QUOTES, 'UTF-8');
                return $page;
            });
    
            $total = Page::where('category_id', $categoryId)->count();
    
            return response()->json([
                'status' => 'success',
                'data' => $decodedPages,
                'total' => $total
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }


    /**
     * Get Description of article (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function getDesPages(Request $request)
    {
        $request->validate([
            'id' => 'required|integer',
        ]);
    
        try {
            $pageId = $request->input('id');
            $pages = Page::select('description')
                ->where('id', $pageId)
                ->get();
    
            // Encode dữ liệu tiếng Việt trước khi gửi qua API
            $encodedPages = $pages->map(function ($page) {
                $page->description = html_entity_decode($page->description, ENT_QUOTES, "UTF-8");
                return $page;
            });
    
            return response()->json([
                'status' => 'success',
                'data' => $encodedPages,
            ], 200)->header('Content-Type', 'application/json; charset=UTF-8');
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        } 
    }

    /**
     * Get Chat (API)
     *
     * @param Request $request
     * @return \Illuminate\Http\Response
     */
    public function getChat(Request $request)
    {
        $request->validate([
            'keyword' => 'required|string|max:20', // Kiểm tra keyword bắt buộc và tối đa 20 ký tự
        ]);
    
        try {
            $keyword = $request->input('keyword');
    
            // Tìm kiếm Tác Phẩm theo keyword trong tiêu đề và mô tả
            $pages = Page::where('title', 'like', "%{$keyword}%")
                ->orWhere('description', 'like', "%{$keyword}%")
                ->get(['id', 'title', 'description']); // Chọn trường cần thiết
    
            // Decode HTML entities trước khi trả dữ liệu
            $result = $pages->map(function ($page) {
                return [
                    'id' => $page->id,
                    'name' => html_entity_decode($page->title, ENT_QUOTES, 'UTF-8'), // Decode title
                    'articles' => [
                        'description' => html_entity_decode($page->description, ENT_QUOTES, 'UTF-8') // Decode description
                    ]
                ];
            });
    
            return response()->json([
                'status' => 'success',
                'data' => $result
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
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        if (request()->ajax()) {
            if ($isTrashed) {
                $pages = Page::orderBy('id', 'desc')
                    ->where('status', 0)
                    ->get();
            } else {
                $pages = Page::orderBy('id', 'desc')
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->get();
            }

            $datatable = DataTables::of($pages, $isTrashed)
                ->addIndexColumn()
                ->addColumn(
                    'action',
                    function ($row) use ($isTrashed) {
                        $csrf = "" . csrf_field() . "";
                        $method_delete = "" . method_field("delete") . "";
                        $method_put = "" . method_field("put") . "";
                        $html = '<a class="btn waves-effect waves-light btn-info btn-sm btn-circle" title="View Page Details" href="' . route('admin.pages.show', $row->id) . '"><i class="fa fa-eye"></i></a>';

                        if ($row->deleted_at === null) {
                            $deleteRoute =  route('admin.pages.destroy', [$row->id]);
                            if ($this->user->can('page.edit')) {
                                $html .= '<a class="btn waves-effect waves-light btn-success btn-sm btn-circle ml-1 " title="Edit Page Details" href="' . route('admin.pages.edit', $row->id) . '"><i class="fa fa-edit"></i></a>';
                            }
                            if ($this->user->can('page.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Admin" id="deleteItem' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        } else {
                            $deleteRoute =  route('admin.pages.trashed.destroy', [$row->id]);
                            $revertRoute = route('admin.pages.trashed.revert', [$row->id]);

                            if ($this->user->can('page.delete')) {
                                $html .= '<a class="btn waves-effect waves-light btn-warning btn-sm btn-circle ml-1" title="Revert Back" id="revertItem' . $row->id . '"><i class="fa fa-check"></i></a>';
                                $html .= '
                                <form id="revertForm' . $row->id . '" action="' . $revertRoute . '" method="post" style="display:none">' . $csrf . $method_put . '
                                    <button type="submit" class="btn waves-effect waves-light btn-rounded btn-success"><i
                                            class="fa fa-check"></i> Confirm Revert</button>
                                    <button type="button" class="btn waves-effect waves-light btn-rounded btn-secondary" data-dismiss="modal"><i
                                            class="fa fa-times"></i> Cancel</button>
                                </form>';
                                $html .= '<a class="btn waves-effect waves-light btn-danger btn-sm btn-circle ml-1 text-white" title="Delete Page Permanently" id="deleteItemPermanent' . $row->id . '"><i class="fa fa-trash"></i></a>';
                            }
                        }



                        $html .= '<script>
                            $("#deleteItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Tác Phẩm sẽ bị xóa !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deleteForm' . $row->id . '").submit();}})
                            });
                        </script>';

                        if ($this->user->can('page.delete')) {
                            $html .= '<script>
                            $("#deleteItemPermanent' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Tác phẩm sẽ bị xóa vĩnh viễn !",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, delete it!"
                                }).then((result) => { if (result.value) {$("#deletePermanentForm' . $row->id . '").submit();}})
                            });
                        </script>';

                            $html .= '<script>
                            $("#revertItem' . $row->id . '").click(function(){
                                swal.fire({ title: "Are you sure?",text: "Tác Phẩm sẽ được revert back!",type: "warning",showCancelButton: true,confirmButtonColor: "#DD6B55",confirmButtonText: "Yes, Revert Back!"
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
                ->editColumn('banner_image', function ($row) {
                    if ($row->banner_image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->banner_image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->editColumn('image', function ($row) {
                    if ($row->image != null) {
                        return "<img src='" . asset('public/assets/images/pages/' . $row->image) . "' class='img img-display-list' />";
                    }
                    return '-';
                })
                ->addColumn('category', function ($row) {
                    $html = "";
                    $category = Category::find($row->category_id);
                    if (!is_null($category)) {
                        $html .= "<span>" . $category->name . "</span>";
                    } else {
                        $html .= "-";
                    }
                    return $html;
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
            $rawColumns = ['action', 'title', 'status', 'category', 'banner_image', 'image'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }

        $count_pages = count(Page::select('id')->get());
        $count_active_pages = count(Page::select('id')->where('status', 1)->get());
        $count_trashed_pages = count(Page::select('id')->where('deleted_at', '!=', null)->get());
        return view('article::pages.index', compact('count_pages', 'count_active_pages', 'count_trashed_pages'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::select('id', 'name')->distinct()->get();
        $article_types = ArticleType::all();
        return view('article::pages.create', compact('article_types','categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('page.create')) {
            return abort(403, 'You are not allowed to access this page !');
        }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'nullable|max:100|unique:pages,slug',
            'pub_date' => 'required',
            'image'  => 'nullable|image',
            'authors'  => 'required|max:100'
        ]);

        try {
            DB::beginTransaction();
            $page = new Page();
            $page->title = $request->title;
            if ($request->slug) {
                $page->slug = $request->slug;
            } else {
                $page->slug = StringHelper::createSlug($request->title, 'Modules\Article\Entities\Page', 'slug', '-', true);
            }

            if (!is_null($request->image)) {
                $page->image = UploadHelper::upload('image', $request->image, $request->title . '-' . time() . '-logo', 'public/assets/images/pages');
            }

            $page->category_id = $request->category_id;
            $page->article_type_id = $request->article_type_id;
            $page->pub_date = $request->pub_date;
            $page->status = $request->status;
            $page->authors = $request->authors;
            $page->description = $request->description;
            //$page->meta_description = $request->meta_description;
            $page->created_at = Carbon::now();
            $page->created_by = Auth::id();
            $page->updated_at = Carbon::now();
            $page->save();
            // Save tags if provided
            if ($request->has('tags')) {
                $tags = array_map('trim', $request->tags);
                $page->tags = $tags;
                $page->save();
            }
            Track::newTrack($page->title, 'Tác Phẩm đã được tạo');
            DB::commit();
            session()->flash('success', 'Tác Phẩm đã được tạo thành công !!');
            return redirect()->route('admin.pages.index');
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
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        $categories = DB::table('categories')->select('id', 'name')->get();
        return view('article::pages.show', compact('categories', 'page'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        // Lấy danh sách categories giống như trong phương thức create
        $categories = Category::select('id', 'name')->distinct()->get();
        $article_types = ArticleType::all();
        return view('article::pages.edit', compact('page', 'article_types','categories'));
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
        if (is_null($this->user) || !$this->user->can('page.edit')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.index');
        }

        $request->validate([
            'title'  => 'required|max:100',
            'slug'  => 'required|max:100|unique:pages,slug,' . $page->id,
        ]);

        try {
            DB::beginTransaction();
            $page->title = $request->title;
            $page->slug = $request->slug;
            $page->status = $request->status;
            if (!is_null($request->banner_image)) {
                $page->banner_image = UploadHelper::update('banner_image', $request->banner_image, $request->title . '-' . time() . '-banner', 'public/assets/images/pages', $page->banner_image);
            }

            $page->category_id = $request->category_id;
            $page->article_type_id = $request->article_type_id;
            $page->status = $request->status;
            $page->description = $request->description;
            $page->authors = $request->authors;
            $page->updated_by = Auth::id();
            $page->updated_at = Carbon::now();
            $page->save();

            // Save tags if provided
            if ($request->has('tags')) {
                $tags = array_map('trim', $request->tags);
                $page->tags = $tags;
                $page->save();
            }

            Track::newTrack($page->title, 'Tác Phẩm đã được sửa!!');
            DB::commit();
            session()->flash('success', 'Tác Phẩm đã được sửa thành công !!');
            return redirect()->route('admin.pages.index');
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
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = Carbon::now();
        $page->deleted_by = Auth::id();
        $page->status = 0;
        $page->save();

        session()->flash('success', 'Page has been deleted successfully as trashed !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * revertFromTrash
     *
     * @param integer $id
     * @return Remove the item from trash to active -> make deleted_at = null
     */
    public function revertFromTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }

        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }
        $page->deleted_at = null;
        $page->deleted_by = null;
        $page->save();

        session()->flash('success', 'Page has been revert back successfully !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * destroyTrash
     *
     * @param integer $id
     * @return void Destroy the data permanently
     */
    public function destroyTrash($id)
    {
        if (is_null($this->user) || !$this->user->can('page.delete')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        $page = Page::find($id);
        if (is_null($page)) {
            session()->flash('error', "The page is not found !");
            return redirect()->route('admin.pages.trashed');
        }

        // Remove Images
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->banner_image);
        UploadHelper::deleteFile('public/assets/images/pages/' . $page->image);

        // Delete Page permanently
        $page->delete();

        session()->flash('success', 'Page has been deleted permanently !!');
        return redirect()->route('admin.pages.trashed');
    }

    /**
     * trashed
     *
     * @return view the trashed data list -> which data status = 0 and deleted_at != null
     */
    public function trashed()
    {
        if (is_null($this->user) || !$this->user->can('page.view')) {
            $message = 'You are not allowed to access this page !';
            return view('errors.403', compact('message'));
        }
        return $this->index(true);
    }
}
