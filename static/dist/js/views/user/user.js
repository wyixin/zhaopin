define([
'jquery',
'underscore',
'backbone',
'text!/dist/templates/user/user.html',
'./partial/sidebar',
'./partial/info'],
function ($, _, Backbone, temp, Sidebar, Info) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'userWrapper',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));

      this.sidebar = new Sidebar();
      this.$el.find('.userSidebarWrapper').append(this.sidebar.el);

      this.content = new Info();
      this.$el.find('.userContentWrapper').append(this.content.el);
    }
  });
});
