<?php

namespace App\Settings;

use Spatie\LaravelSettings\Settings;

class APISettings extends Settings
{
    public ?string $list_api = null;
    public ?string $data_setting_api = null;

    public static function group(): string
    {
        return 'api';
    }
}
