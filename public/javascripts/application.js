window.PadrinoRestApi = Ember.Application.create();

PadrinoRestApi.ApplicationAdapter = DS.RESTAdapter.extend({
  namespace: 'api'
});
