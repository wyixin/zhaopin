define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/footer.html'],function ($, _, Backbone, temp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessFooter',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
