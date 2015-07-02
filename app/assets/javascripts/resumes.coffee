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
    is_sub = true
    resume_work_companies.each (index,fee)->
      if $(this).val()==""
        alert "公司名称不能为空"
        $(this).focus()
        is_sub = false
    if is_sub
      $("#resumeWorkForm").submit()

  $("#intention_job_industry_id").change ->
    if $(@).val()
      subIndustryId = $("#subIndustryId").val()
      if $("#subIndustryId").val()==""
        subIndustryId = 0
      get_info('/resumes/get_sub_industry', $(@).val(), $("#intention_job_sub_industry_id"), subIndustryId)

  $("#intention_job_position_id").change ->
    if $(@).val()
      subPositionId = $("#subPositionId").val()
      if $("#subPositionId").val()==""
        subPositionId = 0
      get_info('/resumes/get_sub_position', $(@).val(), $("#intention_job_sub_position_id"), subPositionId)

  $("#intention_job_city_id").change ->
    if $(@).val()
      areaId = $("#areaId").val()
      if $("#areaId").val()==""
        areaId = 0
      get_info('/resumes/get_area', $(@).val(), $("#intention_job_area_id"), areaId)


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