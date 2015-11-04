class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # def admin_only!
  #   if !current_user.admin?
  #     redirect_to after_sign_in_path_for(current_user)
  #   end
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :first_name,
      :last_name,
      :role
    ]
    devise_parameter_sanitizer.for(:account_update) << [
      :first_name,
      :last_name,
      :role
    ]
  end
end
