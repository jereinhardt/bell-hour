class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    set_user
    @students = Student.all
  end

  def dismiss_all
    current_user.department.school.students.each do |student|
      if @dt == student.dismissal_type && student.with_teacher_id == current_user.id && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  # def dismiss_all_bus
  #   students = Student.all
  #   students.each do |student|
  #     if student.with_teacher_id == current_user.id && student.dismissal_type == "bus" && student.present
  #       student.update(present: false)
  #     end
  #   end
  #   redirect_to user_path(current_user.id)
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
