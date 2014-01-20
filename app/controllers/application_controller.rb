class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #include SessionsHelper
  #include StudentsHelper
  
  before_filter :set_page_title
  
  def set_page_title
    @page_title = params[:controller].titleize + " - " + params[:action].titleize
  end

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) << :year
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :year) }
  end
  
end
