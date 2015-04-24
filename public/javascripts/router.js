PadrinoRestApi.Router.map(function(){
  this.resource('companies', { path: '/' });
});

PadrinoRestApi.CompaniesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('company');
  }
});
