class ResumesController < ApplicationController
  before_action :is_user?
  before_action :set_resume, except: [:display, :index]

  # GET /resumes/1
  # GET /resumes/1.json

  # GET /resumes
  # GET /resumes.json
  def index
    @resumes = Resume.page(params[:page])
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

    @resume_works = ResumeWork.where(:resume_id=>@resume.id)
    @resume_work = @resume_works.first

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
          :job=>params[:resume_work][:job][i],
          :wage=>params[:resume_work][:wage][i],
          :start_time=>start_time,
          :end_time=>end_time,
          :achievements=>params[:resume_work][:achievements][i]
      )
      resume_work.save
    end
    session[:step] = 2

    redirect_to :back
  end

  def create_education
    @resume_education = ResumeEducation.find(params[:id])
    respond_to do |format|
      if @resume_education.update(resume_education_params)
        session[:step] = 3
        format.html { redirect_to :back, notice: 'ResumeEducation was successfully updated.' }
        format.json { render :display, status: :updated, location: @resume_education }
      else
        format.html { render :display }
        format.json { render json: @resume_education.errors, status: :unprocessable_entity }
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
end
