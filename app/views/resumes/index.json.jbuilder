json.array!(@resumes) do |resume|
  json.extract! resume, :id, :status, :user_id, :title, :fullname, :email, :phone, :sex, :birthday, :height, :marriage, :tag, :qq, :intention_jobs, :wage, :district, :photo_img, :photo_audit, :talent, :complete_percent, :click, :tpl
  json.url resume_url(resume, format: :json)
end
