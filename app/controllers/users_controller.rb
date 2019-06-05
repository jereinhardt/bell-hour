class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    set_user
    @students = Student.all
  end

  def dismiss_all_bus
    students = Student.all
    students.each do |student|
      if student.with_teacher_id == current_user.id && student.dismissal_type == "bus" && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def dismiss_all_as
    students = Student.all
    students.each do |student|
      if student.with_teacher_id == current_user.id && student.dismissal_type == "after-school" && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def dismiss_all_walker
    students = Student.all
    students.each do |student|
      if student.with_teacher_id == current_user.id && student.dismissal_type == "walker" && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def dismiss_all_pickup
    students = Student.all
    students.each do |student|
      if student.with_teacher_id == current_user.id && student.dismissal_type == "pickup" && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def dismiss
    #with_teacher dismisses student from school at the end of the day (present == false)
    @student.update(present: false)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_student
    @student = Student.find(params[:id])
  end
end
