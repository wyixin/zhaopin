define(['jquery', 'underscore', 'backbone'],function ($, _, Backbone) {
  var Router = Backbone.Router.extend({
    routes: {
      '': 'getHome',
      'home': 'getHome',
      'guess': 'getGuess',
      'live': 'getLive',
      'market': 'getMarket',
      'deposit': 'getDeposit',
      'user/:partial': 'getUser'
    },
    getHome: function (e) {},
    getGuess: function (e) {},
    getLive: function (e) {},
    getMarket: function (e) {},
    getDeposit: function (e) {},
    getUser: function (e, partial) {}
  });
  return new Router();
});
