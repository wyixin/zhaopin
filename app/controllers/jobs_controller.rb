class JobsController < ApplicationController
  before_action :is_user?
  before_action :set_position

  def index
    @jobs = Job.where(:recommend=>:y)
    if params[:sub_position_id].present?
      @jobs = @jobs.where(:sub_position_id=>params[:sub_position_id])
    end

    @jobs = @jobs.page(params[:page])
  end

  def new_job
    @jobs = Job.order('created_at desc')
    if params[:sub_position_id].present?
      @jobs = @jobs.where(:sub_position_id=>params[:sub_position_id])
    end

    @jobs = @jobs.page(params[:page])

    respond_to do |format|
      format.html { render :index }
      format.json
    end
  end

  def show
    @job = Job.find(params[:id])
  end


  def set_position
    @positions = Position.all
    @hot_sub_positions = SubPosition.where('id in (222,139,31,19)')
  end


end
