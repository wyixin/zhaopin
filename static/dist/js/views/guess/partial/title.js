define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/title.html'],function ($, _, Backbone, temp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessTitle',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
