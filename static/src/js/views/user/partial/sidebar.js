define([
'jquery',
'underscore',
'backbone',
'text!/dist/templates/user/partial/sidebar.html'
],
function ($, _, Backbone, temp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'userSidebar',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
