PadrinoRestApi.Company = DS.Model.extend({
  name: DS.attr('string'),
  address: DS.attr('string'),
  city: DS.attr('string'),
  country: DS.attr('string'),
  email: DS.attr('string'),
  phone: DS.attr('string'),

  employees: DS.hasMany('employee', { async: true })
});
