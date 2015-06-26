class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def is_user?
    if current_user.blank?
      redirect_to :new_user_session
      return
    end
  end
  
  def is_customer?
    is_user?

    if !current_user.role.customer?
      redirect_to :back
      return
    end
  end

  def is_admin?
    is_user?

    if !current_user.role.admin?
      redirect_to :root
      return
    end
  end



  # 错误捕获，在开发环境下不生效
  def self.rescue_errors
    rescue_from Exception,                            :with => :render_error
    rescue_from RuntimeError,                         :with => :render_error
    rescue_from CanCan::AccessDenied,                 :with => :render_access_denied
    rescue_from ActiveRecord::RecordNotFound,         :with => :render_not_found
    rescue_from ActionController::RoutingError,       :with => :render_not_found
    rescue_from ActionController::UnknownController,  :with => :render_not_found
    rescue_from ActionController::UnknownAction,      :with => :render_not_found
  end
  rescue_errors unless Rails.env.development?


  # 渲染示授权页面
  def render_access_denied(e)
    @title = '权限不足'
    @error_class = 'unauthorized'

    logger.error "ERROR 500: #{e.message}"
    e.backtrace.first(5).each { |line| logger.error "  #{line}" }
    respond_to do |format|
      format.html { render template: 'shared/error', layout: false, status: 500 }
    end
  end

  # 渲染500页面
  def render_error(e)
    @title = '系统繁忙'
    @error_class = 'error_500'

    logger.error "ERROR 500: #{e.message}"
    e.backtrace.first(5).each { |line| logger.error "  #{line}" }
    respond_to do |format|
      format.html { render template: 'shared/error', layout: false, status: 500 }
    end
  end

  # 渲染404页面
  def render_not_found(e)
    @title = '页面不存在'
    @error_class = 'error_404'

    logger.error "ERROR 404: #{e.message}"
    e.backtrace.first(5).each { |line| logger.error "  #{line}" }
    respond_to do |format|
      format.html { render template: 'shared/error', layout: false, status: 404 }
    end
  end

  def render_not_found_page
    @title = '您没有该数据访问权限'
    @error_class = 'error_404'
    respond_to do |format|
      format.html { render template: 'shared/error', layout: false, status: 404 }
    end
  end

end
