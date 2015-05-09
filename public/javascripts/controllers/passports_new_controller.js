PadrinoRestApi.PassportsNewController = Ember.Controller.extend({
  actions: {
    setFile: function(file){
      this.set('file', file);
    },

    create: function(employee){
      var uploader = EmberUploader.Uploader.create({
        url: '/api/passports',
        paramNamespace: 'passport'
      });

      uploader.on('didUpload', function(e){
        this.transitionToRoute('employees.show', employee);
      }.bind(this));

      uploader.upload(this.get('file'), { employee_id: employee.id });
    }
  }
});
