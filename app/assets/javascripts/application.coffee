#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .

jQuery ->

  $("#login_user_info_div").click ->
    $("#operate_info_div").show()

  $("#login_user_info_div").mouseout ->
    $("#operate_info_div").hide()

  $("#operate_info_div").mouseover ->
    $(@).show()