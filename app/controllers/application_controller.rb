class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    protected  

  def after_sign_in_path_for(resource)
    if current_user.has_role?(:admin)
      dashboard_path
    elsif current_user.has_role?(:developer)
      root_path
    end
  end    

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
  end    
end
