class StudentsController < ApplicationController
  before_action :set_student, except: [:index, :take_attendance]

  def index
    if params[:query].present?
      @students = Student.search_by_name(params[:query])
    else
      @students = Student.all
    end
  end

  def show

  end

  def update
    @student.update(student_params)
  end

  def take_attendance
    Student.where(id: params[:student_ids]).update_all(present: true)
    redirect_to user_path(current_user.id)
  end

  def take
    #current user takes student from other user(teacher)
    @student.update(previously_with_id: @student.with_teacher_id, with_teacher_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  def give_back
    #current user gives student back to previous teacher
    @student.update(with_teacher_id: @student.previously_with_id, previously_with_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  def give_to_teacher
    #current user gives student back to previous teacher
    @student.update(with_teacher_id: @student.teacher.id, previously_with_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  def dismiss
    #with_teacher dismisses student from school at the end of the day (present == false)
    @student.update(present: false)
    redirect_to student_path(@student.id)
  end

  def mark_present
    @student.update(present: true, with_teacher_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:with_teacher_id, :teacher_id, :present, :dismissal_type, :photo, :previously_with_id)
  end
end
