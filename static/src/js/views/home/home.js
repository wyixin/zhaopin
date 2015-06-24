define(['jquery', 'underscore', 'backbone', './partial/banner', './partial/content', './partial/footer'],function ($, _, Backbone, Banner, Content, Footer) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'home',
    initialize: function () {
      this.banner = new Banner();
      this.$el.append(this.banner.el);

      this.content = new Content();
      this.$el.append(this.content.el);

      this.footer = new Footer();
      this.$el.append(this.footer.el);

    }
  });
});
