class JobsController < ApplicationController
  before_action :is_user?
  before_action :set_category

  def index
    @jobs = Job.where(:recommend=>:y)
  end

  def new_job
    @jobs = Job.order('created_at desc')
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
