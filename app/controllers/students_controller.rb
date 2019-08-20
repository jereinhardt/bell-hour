class StudentsController < ApplicationController
  before_action :set_student, except: [:index]

  def index
    @students = Student.all
  end

  def show

  end

  def update
    @student.update(student_params)
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
    params.require(:student).permit(:with_teacher_id, :guardian_id, :teacher_id, :present, :transportation_type, :photo, :previously_with_id)
  end
end
