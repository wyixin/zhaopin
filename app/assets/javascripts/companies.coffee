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
        alert "招聘岗位不能为空"
        $(this).focus()
        is_sub = false
    if is_sub
      $("#company_job_form").submit()

  $("#job_position_id").change ->
    if $(@).val()
      subPositionId = $("#subPositionId").val()
      if $("#subPositionId").val()==""
        subPositionId = 0
      get_info('/resumes/get_sub_position', $(@).val(), $("#job_sub_position_id"), subPositionId)

  get_info = (url, id, select_id, hidden_id_val) ->
    $.ajax
      url: url
      data:
        id: id
      type: 'post'
      success: (data) ->
        if data.results != ''
          bhtml = "<option value=''>请选择</option>"
          for {id, text} in data.results
            if id==parseInt(hidden_id_val)
              bhtml += "<option value='#{id}' selected>#{text}</option>"
            else
              bhtml += "<option value='#{id}'>#{text}</option>"

          select_id.html(bhtml)
      error: (e) ->
        console.log e