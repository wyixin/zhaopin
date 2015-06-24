define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/common/header.html', './../modules/dropMenu'],function ($, _, Backbone, temp, dropMenu) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'headerWrapper',
    template: _.template(temp),
    initialize: function (routes) {
      this.listenTo(routes, 'route', this.render);
    },
    render: function (getRoute) {
      this.$el.html(this.template({}));
      _.each(this.$el.find('.navItem'), function (item) {
        var $item = $(item);
        if($item.attr('data-route') === getRoute) {
          $item.addClass('active');
        } else {
          $item.removeClass('active');
        }
      });
      this.$el.find('.dropMenuWrapper').betDropMenu();
    }
  });
});
