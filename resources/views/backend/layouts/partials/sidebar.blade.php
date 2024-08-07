@php $user = Auth::user(); @endphp

<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <i class="mdi mdi-dots-horizontal"></i>
                    <span class="hide-menu">
                        {{ $user->first_name }}
                        <span class="badge badge-info">{{ $user->language ? $user->language->name : '' }}</span>
                    </span>
                </li>

                @if ($user->can('dashboard.view'))
                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('admin.index') }}" aria-expanded="false">
                        <i class="mdi mdi-creation"></i>
                        <span class="hide-menu">Dashboard</span>
                    </a>
                </li>
                @endcan

                @if ($user->can('admin.view') || $user->can('admin.create') || $user->can('role.view') || $user->can('role.create'))
                <li class="sidebar-item ">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-account"></i>
                        <span class="hide-menu">Quản Lý User </span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.admins.index') || Route::is('admin.admins.create') || Route::is('admin.admins.edit')) ? 'in' : null }}">
                        @if ($user->can('admin.view'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.admins.index') }}" class="sidebar-link {{ (Route::is('admin.admins.index') || Route::is('admin.admins.edit')) ? 'active' : null }}">
                                <i class="mdi mdi-view-list"></i>
                                <span class="hide-menu"> Danh Sách User </span>
                            </a>
                        </li>
                        @endcan

                        @if ($user->can('admin.create'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.admins.create') }}" class="sidebar-link {{ Route::is('admin.admins.create') ? 'active' : null }}">
                                <i class="mdi mdi-plus-circle"></i>
                                <span class="hide-menu"> Tạo User Mới </span>
                            </a>
                        </li>
                        @endcan

                        @if ($user->can('role.view'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.roles.index') }}" class="sidebar-link {{ Route::is('admin.roles.index') ? 'active' : null }}">
                                <i class="mdi mdi-view-quilt"></i>
                                <span class="hide-menu"> Phân Quyền </span>
                            </a>
                        </li>
                        @endcan

                        @if ($user->can('role.create'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.roles.create') }}" class="sidebar-link {{ Route::is('admin.roles.create') ? 'active' : null }}">
                                <i class="mdi mdi-plus-circle"></i>
                                <span class="hide-menu"> Danh sách Phân Quyền </span>
                            </a>
                        </li>
                        @endcan
                    </ul>
                </li>
                @endcan

                @if ($user->can('category.view') || $user->can('category.create'))
                <li class="sidebar-item ">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-tune"></i>
                        <span class="hide-menu">Categories </span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.categories.index') || Route::is('admin.categories.create') || Route::is('admin.categories.edit')) ? 'in' : null }}">
                        @if ($user->can('category.view'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.categories.index') }}" class="sidebar-link {{ (Route::is('admin.categories.index') || Route::is('admin.categories.edit')) ? 'active' : null }}">
                                <i class="mdi mdi-view-list"></i>
                                <span class="hide-menu"> Danh Sách Phân Loại  </span>
                            </a>
                        </li>
                        @endif

                        @if ($user->can('category.create'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.categories.create') }}" class="sidebar-link {{ Route::is('admin.categories.create') ? 'active' : null }}">
                                <i class="mdi mdi-plus-circle"></i>
                                <span class="hide-menu"> Tạo Phân Loại </span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif

                @if ($user->can('page.view') || $user->can('page.create'))
                <li class="sidebar-item ">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-tag-text-outline"></i>
                        <span class="hide-menu">Tác Phẩm </span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.pages.index') || Route::is('admin.pages.create') || Route::is('admin.pages.edit')) ? 'in' : null }}">
                        @if ($user->can('page.view'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.pages.index') }}" class="sidebar-link {{ (Route::is('admin.pages.index') || Route::is('admin.pages.edit')) ? 'active' : null }}">
                                <i class="mdi mdi-view-list"></i>
                                <span class="hide-menu"> Danh Sách Tác Phẩm </span>
                            </a>
                        </li>
                        @endif

                        @if ($user->can('page.create'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.pages.create') }}" class="sidebar-link {{ Route::is('admin.pages.create') ? 'active' : null }}">
                                <i class="mdi mdi-plus-circle"></i>
                                <span class="hide-menu"> Tạo Tác Phẩm </span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif

                @if ($user->can('poetry.view') || $user->can('poetry.create'))
                <li class="sidebar-item ">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-arrow-right-drop-circle"></i>
                        <span class="hide-menu">Câu Thơ Random </span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.poetry.index') || Route::is('admin.poetry.create') || Route::is('admin.poetry.edit')) ? 'in' : null }}">
                        @if ($user->can('poetry.view'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.poetry.index') }}" class="sidebar-link {{ (Route::is('admin.poetry.index') || Route::is('admin.poetry.edit')) ? 'active' : null }}">
                                <i class="mdi mdi-view-list"></i>
                                <span class="hide-menu"> Danh Sách Câu Thơ Random </span>
                            </a>
                        </li>
                        @endif

                        @if ($user->can('poetry.create'))
                        <li class="sidebar-item">
                            <a href="{{ route('admin.poetry.create') }}" class="sidebar-link {{ Route::is('admin.poetry.create') ? 'active' : null }}">
                                <i class="mdi mdi-plus-circle"></i>
                                <span class="hide-menu"> Tạo Câu Thơ Random </span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </li>
                @endif



                @if ($user->can('author.view') || $user->can('author.create'))
                    <li class="sidebar-item ">
                        <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                            <i class="mdi mdi-view-list"></i>
                            <span class="hide-menu"> Tác Phẩm Liên Quan </span>
                        </a>
                        <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.authors.index') || Route::is('admin.authors.create') || Route::is('admin.authors.edit')) ? 'in' : null }}">
                            @if ($user->can('author.view'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.authors.index') }}" class="sidebar-link {{ (Route::is('admin.authors.index') || Route::is('admin.authors.edit')) ? 'active' : null }}">
                                        <i class="mdi mdi-view-list"></i>
                                        <span class="hide-menu"> Danh Sách Tác Giả  </span>
                                    </a>
                                </li>
                            @endif

                            @if ($user->can('author.create'))
                                <li class="sidebar-item">
                                    <a href="{{ route('admin.authors.create') }}" class="sidebar-link {{ Route::is('admin.authors.create') ? 'active' : null }}">
                                        <i class="mdi mdi-plus-circle"></i>
                                        <span class="hide-menu"> Tạo Thông tin Tác Giả   </span>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </li>
                @endif



                {{-- <li class="nav-small-cap">
                    <i class="mdi mdi-dots-horizontal"></i>
                    <span class="hide-menu">Extra</span>
                </li> --}}


                <li class="sidebar-item ">
                    <a class="sidebar-link has-arrow waves-effect waves-dark" href="javascript:void(0)" aria-expanded="false">
                        <i class="mdi mdi-settings"></i>
                        <span class="hide-menu">Settings </span>
                    </a>
                    <ul aria-expanded="false" class="collapse first-level {{ (Route::is('admin.languages.index') || Route::is('admin.languages.create') || Route::is('admin.languages.edit') || Route::is('admin.languages.connection.index')) ? 'in' : null }}">
                        <li class="sidebar-item">
                            <a href="{{ route('admin.settings.index') }}" class="sidebar-link {{ ( Route::is('admin.settings.index')) ? 'active' : null }}">
                                <i class="mdi mdi-settings"></i>
                                <span class="hide-menu"> Settings </span>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{ route('admin.logout') }}"  onclick="event.preventDefault();
                    document.getElementById('logout-form').submit();" aria-expanded="false">
                        <i class="mdi mdi-directions"></i>
                        <span class="hide-menu">Đăng Xuất</span>
                    </a>
                    <form id="logout-form" action="{{ route('admin.logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
