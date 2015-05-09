PadrinoRestApi.FileUploadComponent = EmberUploader.FileField.extend({
  filesDidChange: (function() {
    var files = this.get('files');
    this.sendAction('action', files[0]);
  }).observes('files')
});
