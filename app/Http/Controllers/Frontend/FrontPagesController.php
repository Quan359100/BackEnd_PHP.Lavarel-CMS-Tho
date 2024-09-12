<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User; // Kiểm tra lớp User đã được nhập đúng
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use SimpleSoftwareIO\QrCode\Facades\QrCode; // Kiểm tra QrCode đã được nhập đúng

class FrontPagesController extends Controller
{
    public function index()
    {
        return view('frontend.pages.index');
    }

    public function register(Request $request)
    {
        // Xác thực dữ liệu đầu vào
        $request->validate([
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'membership' => 'required|in:Basic,Advance,Premium'
        ]);

        try {
            DB::beginTransaction();

            // Tạo mới một người dùng
            $user = new User();
            $user->email = $request->email;
            $user->password = Hash::make($request->password); // Sửa lỗi: sử dụng $request->password thay vì $request->authors
            $user->membership = $request->membership;
            $user->status = 'Inactive';
            $user->created_at = Carbon::now();
            $user->created_by = Auth::id();
            $user->updated_at = Carbon::now();
            $user->save();

            // Ghi log thành công
            $log = new Logger('name');
            $log->pushHandler(new StreamHandler(storage_path('logs/test.log'), Logger::DEBUG));
            $log->info('User registered successfully', ['email' => $request->email , 'membership'=> $request->membership ]);

            DB::commit();

            // Tạo mã QR cho thông tin thanh toán
            //$qrCode = QrCode::size(200)->generate('Payment Link or Information');

            return response()->json(['status' => 'success', 'message' => 'User registered successfully!']);
        } catch (\Exception $e) {
            DB::rollBack();
            // Ghi log lỗi
            $log->error('Error registering user', ['error' => $e->getMessage()]);
            return response()->json(['status' => 'error', 'message' => 'An error occurred while registering user.'], 500);
        }
    }
}

