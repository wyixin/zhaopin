define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/live.html', './chat', './video'],function ($, _, Backbone, temp, Chat, Video) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessLive',
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
      this.video = new Video;
      this.$el.find('.videoWrapper').append(this.video.el);
      this.chat = new Chat;
      this.$el.find('.chatWrapper').append(this.chat.el);
    },
  });
});
