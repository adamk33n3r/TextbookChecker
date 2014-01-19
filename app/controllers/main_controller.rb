class MainController < ApplicationController
  def index
    flash[:info] = "Info: Testing my alert-groups ;)"
    flash[:success] = "Success"
    flash[:warning] = "Warning"
    flash[:danger] = "Danger"
  end
end
