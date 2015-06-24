require 'test_helper'

class ResumesControllerTest < ActionController::TestCase
  setup do
    @resume = resumes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resumes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resume" do
    assert_difference('Resume.count') do
      post :create, resume: { birthday: @resume.birthday, click: @resume.click, complete_percent: @resume.complete_percent, district: @resume.district, email: @resume.email, fullname: @resume.fullname, height: @resume.height, intention_jobs: @resume.intention_jobs, marriage: @resume.marriage, phone: @resume.phone, photo_audit: @resume.photo_audit, photo_img: @resume.photo_img, qq: @resume.qq, resume_attachment_id: @resume.resume_attachment_id, resume_education_id: @resume.resume_education_id, resume_work_id: @resume.resume_work_id, sex: @resume.sex, status: @resume.status, tag: @resume.tag, talent: @resume.talent, title: @resume.title, tpl: @resume.tpl, user_id: @resume.user_id, wage: @resume.wage }
    end

    assert_redirected_to resume_path(assigns(:resume))
  end

  test "should show resume" do
    get :show, id: @resume
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resume
    assert_response :success
  end

  test "should update resume" do
    patch :update, id: @resume, resume: { birthday: @resume.birthday, click: @resume.click, complete_percent: @resume.complete_percent, district: @resume.district, email: @resume.email, fullname: @resume.fullname, height: @resume.height, intention_jobs: @resume.intention_jobs, marriage: @resume.marriage, phone: @resume.phone, photo_audit: @resume.photo_audit, photo_img: @resume.photo_img, qq: @resume.qq, resume_attachment_id: @resume.resume_attachment_id, resume_education_id: @resume.resume_education_id, resume_work_id: @resume.resume_work_id, sex: @resume.sex, status: @resume.status, tag: @resume.tag, talent: @resume.talent, title: @resume.title, tpl: @resume.tpl, user_id: @resume.user_id, wage: @resume.wage }
    assert_redirected_to resume_path(assigns(:resume))
  end

  test "should destroy resume" do
    assert_difference('Resume.count', -1) do
      delete :destroy, id: @resume
    end

    assert_redirected_to resumes_path
  end
end
