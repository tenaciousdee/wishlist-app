class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :username, :email, :image, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :username, :email, :image, :password, :current_password) }
  end

  private
 
    def after_sign_in_path_for(resource)
       "/lists"
    end

    def after_sign_up_path_for(resource)
      "/lists/new"
    end

    def after_inactive_sign_up_path_for(resource)
      "/lists/new"
    end
end
