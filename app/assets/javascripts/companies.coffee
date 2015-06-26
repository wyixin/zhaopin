# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $("#add_job_btn").on 'click', ->
    newDiv = $(".job_div:first").clone(true)
    $(".job_div:last").after(newDiv)



  $("#company_job_btn").click ->
    job_names = $("input[name='job[name][]']")
    is_sub = true
    job_names.each (index,fee)->
      if $(this).val()==""
        alert "职位名称不能为空"
        $(this).focus()
        is_sub = false
    if is_sub
      $("#company_job_form").submit()