PadrinoRestApi.CompaniesEditController = Ember.Controller.extend({
  actions: {
    update: function(company){
      company.save().then(function(){
        this.transitionTo('companies.show', company);
      }.bind(this));
    }
  }
});
