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

  $("#add_resume_work_btn").click ->
    newDiv = $(".resume_work_div:first").clone(true)
    $(".resume_work_div:last").after(newDiv)


  $("#resume_work_btn").click ->
    resume_work_companies = $("input[name='resume_work[company][]']")
    resume_work_companies.each (index,fee)->
      if $(this).val()==""
        alert "公司名称不能为空"
        $(this).focus()
        return false

    $("#resume_work_form").submit()