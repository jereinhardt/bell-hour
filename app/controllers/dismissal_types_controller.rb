class DismissalTypesController < ApplicationController
  def dismiss_type_with
    set_dt
    current_user.department.school.students.each do |student|
      if @dt == student.dismissal_type && student.with_teacher_id == current_user.id && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  private

  def set_dt
    @dt = DismissalType.find(params[:id])
  end


end