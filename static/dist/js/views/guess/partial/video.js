define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/video.html'],function ($, _, Backbone, temp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessVideo',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
