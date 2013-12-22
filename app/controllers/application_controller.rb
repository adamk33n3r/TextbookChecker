class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include StudentsHelper
  
  before_filter :set_page_title
  
  def set_page_title
    @page_title = params[:controller].titleize + " - " + params[:action].titleize
  end
  
end
