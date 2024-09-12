<?php
namespace App\Http\Controllers\Frontend;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\DB;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Carbon\Carbon;

class SignInController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:users',
            'password' => 'required|min:6',
            'membership' => 'required|in:Basic,Advance,Premium'
        ]);

        try {
            DB::beginTransaction();
            $user = new User();

            $user->email = $request->email;
            $user->password = Hash::make($request->authors);
            $user->membership = $request->membership;
            $user->status = 'Inactive';
            $user->created_at = Carbon::now();
            $user->created_by = Auth::id();
            $user->updated_at = Carbon::now();
            $user->save();

            //Track::newTrack($author->title, 'New Blog has been created');
            DB::commit();
            $log = new Logger('name');
$log->pushHandler(new StreamHandler(storage_path('logs/test.log'), Logger::DEBUG));

// Add records to the log
$log->info('success');
        } catch (\Exception $e) {
            DB::rollBack();
            return back();
        }

        // $user = User::store([
        //     'email' => $request->email,
        //     'password' => Hash::make($request->password),
        //     'membership' => $request->membership,
        //     'status' => 'Inactive',
        //     'created_at' => Carbon::now(),
        //     'updated_at' => Carbon::now(),
        // ]);

        // Generate QR code for payment
        $qrCode = QrCode::size(200)->generate('Payment Link or Information');

        // // Send email with QR code
        // Mail::send('emails.payment', ['qrCode' => $qrCode], function($message) use ($user) {
        //     $message->to($user->email);
        //     $message->subject('Payment for your membership');
        // });

        return response()->json(['status' => 'success', 'message' => 'User registered successfully!']);
    }
}


