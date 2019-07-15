class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    set_user
    @students = current_user.department.school.students
  end

  def give_class_to
    current_user.students.each do |student|
      if student.with_teacher == current_user
        student.update(with_teacher_id: @user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
