define(['jquery'],function ($) {
  return $.fn.extend({
    betDropMenu: function () {      
      return this.each(function () {
        var $this = $(this);
        var $menu = $this.find('.optsMenu')
        $this.on('click', '.dropDown', function (e) {
          if($menu.hasClass('hide')) {
            $menu.removeClass('hide');
          } else {
            $menu.addClass('hide')
          }
          e.stopPropagation();
        });
        $('body').on('click', function () {
          $menu.addClass('hide');
        });
      });
    }
  })
});
