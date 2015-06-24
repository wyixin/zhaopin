define([
'jquery',
'underscore',
'backbone',
'text!/dist/templates/user/partial/info.html'
],
function ($, _, Backbone, temp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'userInfo',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
      this.$el.find('.selectWrapper').betSelect();
    }
  });
});
