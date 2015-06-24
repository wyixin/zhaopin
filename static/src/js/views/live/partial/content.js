define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/live/content.html'],function ($, _, Backbone, tempContent) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'contentWrapper',
    template: _.template(tempContent),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
