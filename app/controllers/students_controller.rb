class StudentsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_user_logged_in, except: [:new, :create]
  #before_action :ensure_correct_user, :only => [:edit, :update]
  #before_action :ensure_admin_or_correct_user, :only => [:edit, :updat, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = Student.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if !Student.find_by_username params[:id]
      flash[:danger] = "That student does not exist."
      redirect_to students_path
    end
  end

  # GET /users/new
  def new
    @user = Student.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    puts user_params
    @user = Student.new(user_params)
    #@user.username = @user.email.split('@')[0]
    if @user.save
      #UserMailer.verify_email(@user).deliver
      flash[:success] = "Welcome, #{@user.username.titleize}!"
      cookies[:logged] = true
      cookies[:user] = @user.username
      cookies.signed[:user_id] = @user.id
      redirect_to @user
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = Student.find_by_username(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:student).permit(:email, :password, :password_confirmation, :year)
  end
  
  def ensure_user_logged_in
    unless logged_in?
      flash[:warning] = "You must be logged in to do that."
      session[:return_to] = request.original_url
      redirect_to login_path
    end
  end
  
  def ensure_correct_user
    unless current_user? @user
      flash[:danger] = "This is not you. This is not allowed."
      redirect_to request.referer
    end
  end
  
  def ensure_admin_or_correct_user
    unless logged_in?
      flash[:warning] = "You must be logged in to do that."
      session[:return_to] = request.original_url
      redirect_to login_path
      return
    end
      
    unless current_user.admin? || current_user?(@user)
      flash[:danger] = "You are not admin. This is not allowed."
      puts request.referer
      redirect_to request.referer
    end
  end
end
