class JobsController < ApplicationController
  before_action :is_user?
  before_action :set_category

  def index
    @jobs = Job.where(:recommend=>:y)
    if params[:sub_category_id].present?
      @jobs = @jobs.where(:sub_category_id=>params[:sub_category_id])
    end
  end

  def new_job
    @jobs = Job.order('created_at desc')
    if params[:job_name].present?
      @jobs = @jobs.where("name like '%#{params[:job_name]}%'")
    end
    if params[:sub_category_id].present?
      @jobs = @jobs.where(:sub_category_id=>params[:sub_category_id])
    end
    respond_to do |format|
      format.html { render :index }
      format.json
    end
  end

  def set_category
    @categories = Category.all
    @hot_sub_categories = SubCategory.where(:category_id=>6)
  end

end
