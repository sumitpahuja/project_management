class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :is_admin?, unless: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end


  protected  

  def is_admin?
    @admin = admin?
  end

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:admin)
      projects_path
    elsif current_user.has_role?(:developer)
      root_path
    end
  end    

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end    

  def developer?
    current_user.has_role? :developer
  end

  def admin?
    current_user.has_role? :admin
  end
end
