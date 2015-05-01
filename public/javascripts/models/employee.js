PadrinoRestApi.Employee = DS.Model.extend({
  name: DS.attr('string'),

  company: DS.belongsTo('company', { async: true }),
  position: DS.belongsTo('position', { async: true }),

  passports: DS.hasMany('passport', { async: true })
});
