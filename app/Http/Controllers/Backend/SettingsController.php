<?php

namespace App\Http\Controllers\Backend;

use App\Helpers\UploadHelper;
use App\Http\Controllers\Controller;
use App\Models\Track;
use App\Settings\APISettings;
use App\Settings\GeneralSettings;
//use App\Settings\SocialSettings;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Exception;

class SettingsController extends Controller
{
    public $user;

    public GeneralSettings $general;
    public APISettings $api;
    //ublic SocialSettings $social;

    public function __construct(GeneralSettings $general, APISettings $api)
    {
        $this->general = $general;
        $this->api = $api;

        $this->middleware(function ($request, $next) {
            $this->user = Auth::user();
            return $next($request);
        });
    }

    public function index()
    {
        if (is_null($this->user) || !$this->user->can('settings.edit')) {
            return abort(403, 'You are not allowed to access this page.');
        }

        return view('backend.pages.settings.edit');
    }

    public function update(Request $request)
    {
        if (is_null($this->user) || !$this->user->can('settings.edit')) {
            return abort(403, 'You are not allowed to access this page.');
        }

        try {
            DB::beginTransaction();

            // General settings update.
            $this->general->name = $request->name;
            if (!is_null($request->logo)) {
                $this->general->logo = UploadHelper::update('logo', $request->logo, 'logo', 'public/assets/images/logo', $this->general->logo);
            }

            if (!is_null($request->favicon)) {
                $this->general->favicon = UploadHelper::update('favicon', $request->favicon, 'favicon', 'public/assets/images/logo', $this->general->favicon);
            }

            $this->general->description      = $request->description;
            $this->general->copyright_text   = $request->copyright_text;
            $this->general->meta_author      = $request->meta_author;
            $this->general->save();
            
            // API Update
            $this->api->list_api = $request->list_api;
            $this->api->data_setting_api = $request->data_setting_api;
            $this->api->save();
            Track::newTrack('Settings', 'Setting was updated.');

            DB::commit();
            session()->flash('success', 'Settings has been updated successfully.');

            return redirect()->route('admin.settings.index');
        } catch (Exception $e) {
            session()->flash('db_error', $e->getMessage());
            DB::rollBack();
            return back();
        }
    }

    // API : get data  from settings 
    public function getDataSettings(): JsonResponse
    {
        // Lấy dữ liệu từ APISettings
        $apiSettings = app(APISettings::class);
        $dataSettingApi = $apiSettings->data_setting_api;
    
        // Decode HTML entities nếu dataSettingApi là một chuỗi
        if (is_string($dataSettingApi)) {
            $dataSettingApi = html_entity_decode($dataSettingApi, ENT_QUOTES, 'UTF-8');
        }
    
        // Trả về dữ liệu dưới dạng JSON
        return response()->json([
            'status' => 'success',
            'data_setting_api' => $dataSettingApi,
        ]);
    }
}
