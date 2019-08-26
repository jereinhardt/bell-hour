class UsersController < ApplicationController
  before_action :set_user, except: :take_back_class

  def index
    @users = User.all
  end

  def show
    @students = current_user.students
    @teachers = []
    @user.department.school.users.each do |user|
      if user.teacher
        @teachers << user
      end
    end
  end

  def give_class_to
    current_user.students.each do |student|
      if student.with_teacher == current_user
        student.update(with_teacher_id: @user.id, previously_with_id: current_user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def take_back_class
    current_user.students.each do |student|
      if student.with_teacher != current_user && student.present
        student.update(with_teacher_id: current_user.id, previously_with_id: student.previously_with.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
