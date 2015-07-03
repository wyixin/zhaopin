class ResumesController < ApplicationController
  before_action :is_user?
  before_action :set_resume, except: [:display, :index, :get_sub_industry, :get_sub_position, :get_area]

  # GET /resumes/1
  # GET /resumes/1.json

  # GET /resumes
  # GET /resumes.json
  def index
    if params[:key_words].present?
      @resumes = Resume.joins(:intention_job).where("intention_jobs.position_id=(select id from positions where name like '%#{params[:key_words]}%')
                                             or intention_jobs.sub_position_id=(select id from sub_positions where name like '%#{params[:key_words]}%')
                                             or resumes.tag like '%#{params[:key_words]}%'").page(params[:page])

    else
      @resumes = Resume.page(params[:page])
    end

  end



  def display
    if session[:step].blank?
      session[:step] = 1
    end
    @resume = Resume.new
    @resume_education = ResumeEducation.new
    if params[:resume_id].present?
      @resume = Resume.find(params[:resume_id])
      @resume_education = ResumeEducation.where(:user_id=>@resume.user_id).first
    else
      @resume = Resume.where(:user_id=>current_user.id).first
      @resume_education = ResumeEducation.where(:user_id=>current_user.id).first
    end

    @intention_job = IntentionJob.new
    if @resume.intention_job_id.present?
      @intention_job = IntentionJob.find(@resume.intention_job_id)
    end

    @resume_works = ResumeWork.where(:resume_id=>@resume.id)
    @resume_work = @resume_works.first

    @trainings = Training.where(:resume_id=>@resume.id)
    @training = Training.new

  end

  def modify
    respond_to do |format|

      if params[:resume][:photo_img].present?
        params[:resume][:photo_img] = uploadFile(params[:resume][:photo_img])
      end

      if @resume.update(resume_params)
        session[:step] = 1
        format.html { redirect_to :back, notice: 'Resume was successfully updated.' }
        format.json { render :display, status: :created, location: @resume }
      else
        format.html { render :display }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_work
    @resume.resume_works.destroy_all
    resume_work_length = params[:resume_work][:company].length

    (0..resume_work_length-1).each do |i|
      start_time = "#{params[:resume_work]['start_time(1i)'][i]}-#{params[:resume_work]['start_time(2i)'][i]}-#{params[:resume_work]['start_time(3i)'][i]}"
      end_time = "#{params[:resume_work]['end_time(1i)'][i]}-#{params[:resume_work]['end_time(2i)'][i]}-#{params[:resume_work]['end_time(3i)'][i]}"
      resume_work = ResumeWork.new(
          :resume_id=>@resume.id,
          :company=>params[:resume_work][:company][i],
          :number=>params[:resume_work][:number][i],
          :industry=>params[:resume_work][:industry][i],
          :job=>params[:resume_work][:job][i],
          :wage=>params[:resume_work][:wage][i],
          :start_time=>start_time,
          :end_time=>end_time,
          :achievements=>params[:resume_work][:achievements][i],
          :quality_case=>params[:resume_work][:quality_case][i],
          :ranking=>params[:resume_work][:ranking][i],
          :reasons=>params[:resume_work][:reasons][i]
      )
      resume_work.save
    end
    session[:step] = 2

    respond_to do |format|
      format.html { redirect_to :back, notice: '工作经历编辑成功.' }
    end
  end

  def create_train
    @resume.trainings.destroy_all
    training_length = params[:training][:name].length
    (0..training_length-1).each do |i|
      start_time = "#{params[:training]['start_time(1i)'][i]}-#{params[:training]['start_time(2i)'][i]}-#{params[:training]['start_time(3i)'][i]}"
      end_time = "#{params[:training]['end_time(1i)'][i]}-#{params[:training]['end_time(2i)'][i]}-#{params[:training]['end_time(3i)'][i]}"
      training = Training.new(
          :resume_id=>@resume.id,
          :name=>params[:training][:name][i],
          :start_time=>start_time,
          :end_time=>end_time,
          :content=>params[:training][:content][i]
      )
      training.save
    end

    session[:step] = 5

    respond_to do |format|
      format.html { redirect_to :back, notice: '培训经历编辑成功.' }
    end
  end

  def create_education
    @resume_education = ResumeEducation.find(params[:id])
    respond_to do |format|
      if @resume_education.update(resume_education_params)
        session[:step] = 3
        format.html { redirect_to :back, notice: '教育背景编辑成功.' }
        format.json { render :display, status: :updated, location: @resume_education }
      else
        format.html { render :display }
        format.json { render json: @resume_education.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_intention_job
    respond_to do |format|
      session[:step] = 4
      if @resume.intention_job_id.blank?
        @intention_job = IntentionJob.new(intention_job_params)
        @intention_job.save
        @resume.update_attribute('intention_job_id', @intention_job.id)
      else
        @intention_job = IntentionJob.find(@resume.intention_job_id)
        @intention_job.update(intention_job_params)
      end
      format.html { redirect_to :back, notice: '求职意向编辑成功.' }
    end
  end


  def get_sub_industry
    @sub_industries = SubIndustry.where(:industry_id=>params[:id])

    respond_to do |format|
      format.json do
        render json: {
                   :results => (@sub_industries.map{|e| { :id => e.id, :text => e.name }} rescue '')
               }
      end
    end
  end

  def get_sub_position
    @sub_positions = SubPosition.where(:position_id=>params[:id])
    respond_to do |format|
      format.json do
        render json: {
                   :results => (@sub_positions.map{|e| { :id => e.id, :text => e.name }} rescue '')
               }
      end
    end
  end

  def get_area
    @areas = Area.where(:city_id=>params[:id])

    respond_to do |format|
      format.json do
        render json: {
                   :results => (@areas.map{|e| { :id => e.id, :text => e.name }} rescue '')
               }
      end
    end
  end
  # # GET /resumes/1/edit
  # def edit
  #   @resume_works = ResumeWork.where(:resume_id=>@resume.id)
  #   @resume_work = @resume_works.first
  # end
  #
  #
  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  # def update
  #   respond_to do |format|
  #     if @resume.update(resume_params)
  #       format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @resume }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @resume.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end



  # # GET /resumes/new
  # def new
  #   #current_user.init_resume
  #   @resume = Resume.new
  #   @resume_work = ResumeWork.new
  # end
  #

  # POST /resumes
  # POST /resumes.json
  # def create
  #   @resume = Resume.new(resume_params)
  #
  #   respond_to do |format|
  #     if @resume.save
  #       format.html { redirect_to :back, notice: 'Resume was successfully created.' }
  #       format.json { render :show, status: :created, location: @resume }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @resume.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  # def destroy
  #   @resume.destroy
  #   respond_to do |format|
  #     format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    def create_user(email)
      User.create(email: email,
                  password: '11111111',
                  password_confirmation: '11111111',
                  role: :user)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(
          :title, :fullname, :email, :phone, :sex,
          :birthday, :height, :marriage,
          :tag, :qq, :intention_jobs,
          :wage, :district, :photo_img,
          :photo_audit, :talent,
          :complete_percent, :click, :tpl,
          :educational, :address, :political_status,
          :driving_license, :driving_age, :evaluation
      )
    end

    def resume_work_params
      params.require(:resume_work).permit(
          :id, :company, :job, :wage,
          :start_time, :end_time, :achievements
      )
    end

    def resume_education_params
      params.require(:resume_education).permit(
          :school, :speciality, :education,
          :start_time, :end_time, :reward,
          :school_experience, :computer_ability,
          :foreign_language1, :foreign_language1_ls,
          :foreign_language1_rw, :foreign_language2,
          :foreign_language2_ls, :foreign_language2_rw,
          :mandarin, :other_skills
      )
    end

    def intention_job_params
      params.require(:intention_job).permit(
          :intention_status, :industry_id, :sub_industry_id,
          :position_id, :sub_position_id, :city_id,
          :area_id, :hope_wage, :is_discuss,
          :now_wage, :is_secrecy
      )
    end


end
