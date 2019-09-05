class StudentsController < ApplicationController
  before_action :set_student, except: [:index, :take_attendance]

  def index
    students = policy_scope(Student)
      if params[:query].present?
        @students = students.search_by_name(params[:query])
      else
        @students = []
      end
  end

  def show

  end

  def update
    @student.update(student_params)
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

  def take_attendance
    @students = policy_scope(Student).where(id: params[:student_ids])
    @students.each do |student|
      student.present == false ? student.update(present: true) : nil
    end
    first_student = @students.first
    authorize first_student
    redirect_to user_path(current_user.id)
  end

  def take
    #current user takes student from other user
    Notification.create(recipient: @student.with_teacher, faculty: current_user, action: "took", notifiable: @student)
    @student.update(previously_with_id: @student.with_teacher_id, with_teacher_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  def send_to_teacher
    set_user
    @student.update(with_teacher_id: @user.id, previously_with_id: current_user.id)
    redirect_to student_path(@student.id)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_student
    @student = Student.find(params[:id])
    authorize @student
  end

  def student_params
    params.require(:student).permit(:with_teacher_id, :teacher_id, :present, :dismissal_type, :photo, :previously_with_id)
  end
end
