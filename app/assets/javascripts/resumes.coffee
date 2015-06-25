# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $(".resume_option_div").on 'click', ->
    $(".resume_option_div").removeClass('active')
    $(@).addClass('active')
    dataTarget = $(@).data("target")
    $(".resume_content_div").css("display", 'none')
    $("#"+dataTarget).css("display", 'block')