define(['jquery', 'underscore', 'backbone', 'text!/dist/templates/guess/workspace.html', './../../modules/select'],function ($, _, Backbone, temp, Select) {
  return Backbone.View.extend({
    tagName: 'div',
    className: 'guessWorkspace',
    template: _.template(temp),
    events: {
      'click .betRadio': 'selectTeam',
      'change .selectWrapper': 'onSelectChange'
    },
    initialize: function () {
      this.$el.html(this.template({}));
      this.$el.find('.selectWrapper').betSelect();
    },
    onSelectChange(e, a){
      console.log(e, a);
    },
    selectTeam(e){
      var $target = $(e.currentTarget);
      var radioGroup = $target.attr('data-radioGroup');
      var radios = this.$el.find('.betRadio[data-radioGroup="'+radioGroup+'"]');
      if(radios.length>=2){
        _.each(radios, function (radio, index) {
          $(radio).removeClass('selected');
        });
        $target.addClass('selected'); 
      }
    }
  });
});
