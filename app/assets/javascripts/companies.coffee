# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $("#add_job_btn").on 'click', ->
    newDiv = $(".job_div:first").clone(true)
    $(".job_div:last").after(newDiv)
