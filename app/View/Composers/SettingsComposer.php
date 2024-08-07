<?php

namespace App\View\Composers;

use App\Settings\APISettings;
use App\Settings\GeneralSettings;
//use App\Settings\SocialSettings;
use Illuminate\View\View;
use stdClass;

class SettingsComposer
{
    public GeneralSettings $general;
    //public ContactSettings $contact;
    public APISettings $api;

    public function __construct(GeneralSettings $general, APISettings $api)
    {
        $this->general = $general;
        $this->api = $api;
    }

    /**
     * Bind data to the view.
     *
     * @param  \Illuminate\View\View  $view
     * @return void
     */
    public function compose(View $view)
    {
        $settings = new stdClass();
        $settings->general = $this->general;
        $settings->api = $this->api;

        $view->with('settings', $settings);
    }
}
