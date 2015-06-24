define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/chat.html', 'text!/dist/templates/guess/message.html'],function ($, _, Backbone, temp, msgTemp) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessChat',
    events:{
      'click .target': 'toggleTabs',
      'click .send': 'sendMessage',
      'keyup .messageBox': 'msgBoxKeyUp'
    },
    template: _.template(temp),
    initialize: function () {
      this.$el.html(this.template({}));
    },
    toggleTabs: function (e) {
      var $target = $(e.target);
      _.each(this.$el.find('.target'), function (tar, i) {
        $(tar).removeClass('active');
      });
      $target.addClass('active');
      _.each(this.$el.find('.tab'), function(tab, i){
        $(tab).addClass('hide');
      });
      this.$el.find($target.attr('data-target')).removeClass('hide');
    },
    sendMessage(){
      var $msgBox = this.$el.find('.messageBox');
      if ($msgBox.val().replace(/\s/g,'').length > 0) {
        var $chatBox = this.$el.find('.chatContent');
        var messages = $chatBox.find('.message');

        var objChat = {
          userName: 'weijie',
          message: _.escape($msgBox.val()) || ''
        }
        var temp = _.template(msgTemp, objChat);
        var newMsg = temp(objChat);

        if(messages.length >= 100 ) {
          $(messages[0]).remove();
        }
        $(newMsg).appendTo($chatBox);
        $chatBox.scrollTop(Number.MAX_VALUE);
      }
      $msgBox.val('');
    },
    msgBoxKeyUp: function (e) {
      if(e.keyCode === 13) {
        this.sendMessage();
      }
    }
  });
});
