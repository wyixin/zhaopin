#= require jquery
#= require jquery_ujs
#= require_tree .
#= require simditor

jQuery ->

  editor = new Simditor(
    placeholder: '请输入内容'
    textarea: $('.simditor')
    upload:
      url: '/uploads'
      params: {'Content-Type':'text/html;charset=utf-8'}
      fileKey: 'upload_file'
      connectionCount: 3
      leaveConfirm: '正在上传文件，如果离开上传会自动取消'
      defaultImage: ''

    toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', '|', 'indent', 'outdent', '|', 'hr', 'table']
  )

  $("#login_user_info_div").click ->
    $("#operate_info_div").show()

  $("#login_user_info_div").mouseout ->
    $("#operate_info_div").hide()

  $("#operate_info_div").mouseover ->
    $(@).show()