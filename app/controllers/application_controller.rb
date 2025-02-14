class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    recipes_path
  end

  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def authenticate_user!
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
