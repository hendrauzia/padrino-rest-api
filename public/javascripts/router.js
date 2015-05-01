PadrinoRestApi.Router.map(function(){
  this.resource('companies', function(){
    this.route('new',  { path: 'new' });
    this.route('show', { path: ':id' });
    this.route('edit', { path: ':id/edit' });
  });
});

PadrinoRestApi.IndexRoute = Ember.Route.extend({
  beforeModel: function(){
    this.transitionTo('companies');
  }
});

PadrinoRestApi.CompaniesRoute = Ember.Route.extend({
  model: function(){
    return this.store.find('company');
  }
});

PadrinoRestApi.CompaniesShowRoute = Ember.Route.extend({
  model: function(params){
    return this.store.find('company', params.id);
  }
});

PadrinoRestApi.CompaniesEditRoute = Ember.Route.extend({
  model: function(params){
    return this.store.find('company', params.id);
  }
});
