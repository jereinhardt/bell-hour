class UsersController < ApplicationController
  before_action :set_user, except: [:take_back_class, :send_to_teacher]

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
        student.update(with_teacher_id: @user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def take_back_class
    current_user.students.each do |student|
      if student.with_teacher != current_user && student.present
        student.update(with_teacher_id: current_user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def send_to_teacher
    send_teacher_user
    set_student
    @student.update(with_teacher_id: @user.id)
    redirect_to student_path(@student.id)
  end

  private

  def send_teacher_user
    @user = User.find(params[:student_id])
  end

  def set_student
    @student = Student.find(:id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
