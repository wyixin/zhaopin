define(['jquery', 'underscore', 'backbone', './partial/content'],function ($, _, Backbone, Content) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'live',
    initialize: function () {
      this.content = new Content();
      this.$el.append(this.content.el);
    }
  });
});
