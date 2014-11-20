module StudentsHelper
  def student_has_permission? obj
    current_student.admin? or current_student == obj.student
  end
  def ensure_user_logged_in
    unless logged_in?
      flash[:warning] = "You are required to be logged in. Who knew?"
      redirect_to login_path
    end
  end
  
  def ensure_correct_user
    unless current_student? User.find_by_id(params[:id])
      flash[:danger] = "That is not you, foul beast!"
      redirect_to root_path
    end
  end
  
  def ensure_admin
    unless current_student.admin?
      redirect_to :back
      flash[:danger] = "You do not have that permission, son."
    end
  end
end
