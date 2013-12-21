class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = Student.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Welcome, #{@user.username.titleize}!"
      cookies.signed[:user_id] = @user.id
      session[:return_to] ? redirect_to(session[:return_to]) : redirect_to(@user)
      session[:return_to] = nil
    else
      flash.now[:danger] = "Invalid username or password"
      render :new
    end
  end
  
  def destroy
    @current_user = nil
    cookies.delete :user_id
    cookies.delete :logged
    cookies.delete :user
    redirect_to login_path
  end
end
