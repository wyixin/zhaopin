define([
'jquery',
'underscore',
'backbone',
'./../routers/routes',
'./home/home',
'./live/live', 
'./guess/guess',
'./common/header',
'./user/user'],
function ($, _, Backbone, routes, Home, Live, Guess, Header, User) {
  return Backbone.View.extend({
    el: 'body',
    initialize: function () {
      this.listenTo(routes, 'route', this.render);
      this.header = new Header(routes);
    },
    render: function (getRoute, partial) {
      switch (getRoute) {
        case 'getHome':
          this.childView = new Home();         
          break;
        case 'getGuess':
          this.childView = new Guess();
          break;
        case 'getLive':
          this.childView = new Live();
          break;
        case 'getMarket':
          console.log('view:Market');
          break;
        case 'getDeposit':
          console.log('view:Deposit');
          break;
        case 'getUser':
          this.childView = new User(partial[0]);
          break;
        default:
          // this.childView === 404 PageView
          break;
      }
      this.$el.prepend(this.header.el);
      this.$el.find('.main').html(this.childView.el);
    }
  });
});
