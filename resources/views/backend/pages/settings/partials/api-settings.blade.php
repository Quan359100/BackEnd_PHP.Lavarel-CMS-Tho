<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="logo">
                List API &nbsp;
                <i class="fa fa-info-circle" data-toggle="tooltip"
                    title="Please enter the APIs in the system"></i>
            </label>
            <textarea type="text" class="form-control tinymce_advance" id="list_api" name="list_api">{{ $settings->api->list_api }}</textarea>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label class="control-label" for="logo">
                Create Data  &nbsp;
                <i class="fa fa-info-circle" data-toggle="tooltip"
                    title="Create data for https://setting/api.com"></i>
            </label>
            <textarea type="text" class="form-control tinymce_advance" id="data_setting_api" name="data_setting_api">{{ $settings->api->data_setting_api }}</textarea>
        </div>
    </div>
</div>

<script>
// document.getElementById('description').addEventListener('copy', function(e) {
//   e.preventDefault(); // This prevents copying
// });
</script>