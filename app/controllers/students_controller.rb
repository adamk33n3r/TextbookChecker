class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_student!, except: [:new, :create]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
  end

  # GET /students/1
  # GET /students/1.json
  def show
    if !Student.find_by_username params[:id]
      flash[:danger] = "That student does not exist."
      redirect_to students_path
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    if @student.save
      #UserMailer.verify_email(@user).deliver
      flash[:success] = "Welcome, #{@student.username.titleize}!"
      #cookies[:logged] = true
      #cookies[:user] = @student.username
      #cookies.signed[:user_id] = @user.id
      redirect_to @student
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find_by_username(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def student_params
    params.require(:student).permit(:email, :password, :password_confirmation, :year)
  end
end
