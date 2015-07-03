class CompaniesController < ApplicationController
  before_action :is_user?, only: [:index, :show]
  before_action :is_customer?, only: [:edit, :update, :destroy, :edit_job, :create_job]
  before_action :set_company, only: [:show, :edit, :update, :destroy, :edit_job, :create_job]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.page(params[:page])
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  def edit_job
    @jobs = @company.jobs
    @job = Job.new(:company_id=>@company.id)
    @sub_categories = SubCategory.all
  end

  def create_job
    @company.jobs.destroy_all

    job_length = params[:job][:name].length

    (0..job_length-1).each do |i|
      start_time = "#{params[:job]['strat_time(1i)'][i]}-#{params[:job]['strat_time(2i)'][i]}-#{params[:job]['strat_time(3i)'][i]}"
      end_time = "#{params[:job]['end_time(1i)'][i]}-#{params[:job]['end_time(2i)'][i]}-#{params[:job]['end_time(3i)'][i]}"
      amount = 1
      if params[:job][:amount][i].to_i!=0
        amount = params[:job][:amount][i]
      end
      job = Job.new(
          :company_id=>@company.id,
          :name=>params[:job][:name][i],
          :amount=>amount,
          :sub_position_id=>params[:job][:sub_position_id][i],
          :position_id=>params[:job][:position_id][i],
          :sex=>params[:job][:sex][i],
          :recommend=>params[:job][:recommend][i],
          :strat_time=>start_time,
          :end_time=>end_time,
          :education=>params[:job][:education][i],
          :experience=>params[:job][:experience][i],
          :wage=>params[:job][:wage][i],
          :temptation=>params[:job][:temptation][i],
          :duty=>params[:job][:duty][i],
          :requirement=>params[:job][:requirement][i]
      )
      job.save
    end
    respond_to do |format|
      format.html { redirect_to :back, notice: '公司招聘信息编辑成功.' }
    end
  end


  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save

        format.html { redirect_to root_path, notice: '感谢您对维鼎的信任，您的招聘信息已得到我们的重视，稍后将会有专业的人力资源顾问与您联系帮您完善资料.请您保持电话畅通,谢谢！' }
        format.json
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if params[:company][:logo].present?
        params[:company][:logo] = uploadFile(params[:company][:logo])
      end
      if @company.update(company_params)
        format.html { redirect_to companies_path, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :address, :contact, :phone, :email, :web_site, :logo, :logo_audit, :contents)
    end
end
