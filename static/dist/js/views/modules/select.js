define(['jquery'],function ($) {
  return $.fn.extend({
    betSelect: function () {      
      return this.each(function () {
        var $this = $(this);
        $this.find('.select').attr('data-value', '');
        $this.on('click', '.select', function (e) {
          $('body').find('.optsWrapper').addClass('hide');

          var $optsWrapper = $this.find('.optsWrapper');
          $optsWrapper.removeClass('hide');
          e.stopPropagation();
        });
        $this.on('click', '.opt', function(e){
          var $opt  = $(e.currentTarget);
          var oldValue = $this.find('.select').attr('data-value');
          var newValue = $opt.attr('data-value');


          if(oldValue !== newValue) {
            $this.find('.select').attr('data-value', newValue);
            $this.find('.selectValue').text($opt.text());
            $this.trigger('change', {
              currentTarget: $this.find('.select'),
              oldValue: oldValue,
              newValue: newValue
            });
          }

        });
        $('body').on('click', function () {
          $this.find('.optsWrapper').addClass('hide');
        });
      });
    }
  })
});
