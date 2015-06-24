define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/home/banner.html'],function ($, _, Backbone, tempBanner) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'bannerWrapper',
    template: _.template(tempBanner),
    initialize: function () {
      this.$el.html(this.template({}));
    }
  });
});
