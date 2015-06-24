class ResumesController < ApplicationController
  before_action :is_user?
  before_action :set_resume, only: [:show, :edit, :update, :destroy, :modify]

  # GET /resumes
  # GET /resumes.json
  # def index
  #   @resumes = Resume.all
  # end

  # GET /resumes/1
  # GET /resumes/1.json

  def display
    @resume = Resume.where(:user_id=>current_user.id).first
    @resume_works = ResumeWork.where(:resume_id=>@resume.id)
    @resume_work = @resume_works.first
    @resume_education = ResumeEducation.where(:user_id=>current_user.id).first
  end

  def modify
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to :back, notice: 'Resume was successfully updated.' }
        format.json { render :display, status: :created, location: @resume }
      else
        format.html { render :display }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_work
    @resume_work = ResumeWork.find(params[:id])
    @resume_work.start_time = resume_work_params[1]
    respond_to do |format|
      if @resume_work.update(resume_work_params)
        format.html { redirect_to :back, notice: 'ResumeWork was successfully updated.' }
        format.json { render :display, status: :updated, location: @resume_work }
      else
        format.html { render :display }
        format.json { render json: @resume_work.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_education
    @resume_education = ResumeEducation.find(params[:id])
    respond_to do |format|
      if @resume_education.update(resume_education_params)
        format.html { redirect_to :back, notice: 'ResumeEducation was successfully updated.' }
        format.json { render :display, status: :updated, location: @resume_education }
      else
        format.html { render :display }
        format.json { render json: @resume_education.errors, status: :unprocessable_entity }
      end
    end
  end
  # # GET /resumes/new
  # def new
  #   #current_user.init_resume
  #   @resume = Resume.new
  #   @resume_work = ResumeWork.new
  # end
  #
  # # GET /resumes/1/edit
  # def edit
  #   @resume_works = ResumeWork.where(:resume_id=>@resume.id)
  #   @resume_work = @resume_works.first
  # end

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
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(
          :status, :user_id, :resume_work_id,
          :resume_education_id, :resume_attachment_id,
          :title, :fullname, :email, :phone, :sex,
          :birthday, :height, :marriage,
          :tag, :qq, :intention_jobs,
          :wage, :district, :photo_img,
          :photo_audit, :talent,
          :complete_percent, :click, :tpl
      )
    end

    def resume_work_params
      params.require(:resume_work).permit(
          :company, :job, :wage,
          :start_time, :end_time, :achievements
      )
    end

    def resume_education_params
      params.require(:resume_education).permit(
          :school, :speciality, :education,
          :start_time, :end_time
      )
    end
end
