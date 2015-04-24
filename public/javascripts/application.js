window.PadrinoRestApi = Ember.Application.create({
  LOG_TRANSITIONS: true
});

PadrinoRestApi.ApplicationAdapter = DS.RESTAdapter.extend({
  namespace: 'api'
});
