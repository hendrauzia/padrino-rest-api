PadrinoRestApi.CompaniesNewController = Ember.Controller.extend({
  actions: {
    create: function(data){
      var company = this.store.createRecord('company', {
        name:    data.name,
        address: data.address,
        city:    data.city,
        country: data.country,
        email:   data.email,
        phone:   data.phone
      });

      company.save().then(function(){
        this.transitionTo('companies.show', company)
      }.bind(this));
    }
  }
});
