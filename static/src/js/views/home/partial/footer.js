define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/home/footer.html'],function ($, _, Backbone, template) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'footerWrapper',
    template: _.template(template),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
