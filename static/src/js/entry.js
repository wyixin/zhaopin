(function (root) {
  requirejs.config({
    paths: {
      "jquery": "../../bower_components/jquery/dist/jquery",
      "backbone": "../../bower_components/backbone/backbone",
      "underscore": "../../bower_components/underscore/underscore",
      "almond": "../../bower_components/almond/almond",
      "bootstrap": "../../bower_components/bootstrap/dist/js/bootstrap",
      "text": "../../bower_components/requirejs-text/text"
    },
    shim: {
      "bootstrap": {
        deps: ["jquery"]
      }
    }
  });
  require([
    'jquery', 
    'views/body',
    'backbone',
    './views/modules/select',
    './views/modules/dropMenu'
    ], function ($, Body, Backbone) {
    $(function () {
      new Body();
      Backbone.history.start();
    });
  });
})(this);
