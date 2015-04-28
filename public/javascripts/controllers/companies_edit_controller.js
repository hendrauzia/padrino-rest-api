PadrinoRestApi.CompaniesEditController = Ember.Controller.extend({
  actions: {
    update: function(post){
      post.save();
      this.transitionTo('companies.show', post);
    }
  }
});
