class DismissalTypesController < ApplicationController

  before_action :set_dt, except: [:new, :create]

  def new
    set_school
    @dt = DismissalType.new
    @dt.school = @school
    authorize @dt
  end

  def create
    set_school
    @dt = @school.dismissal_types.build(dismissal_params)
    authorize @dt
    @dt.save
    redirect_to new_school_dismissal_type_path(current_user.school_id)
  end

  def edit
    authorize @dt
  end

  def update
    authorize @dt
    @dt.update(dismissal_params)
    redirect_to new_school_dismissal_type_path(current_user.school_id)
  end

  def destroy
    authorize @dt
    @dt.destroy
    redirect_to new_school_dismissal_type_path(current_user.school_id)
  end

  def dismiss_type_with
    current_user.school.students.each do |student|
      if @dt == student.dismissal_type && student.with_teacher == current_user && student.present
        student.update(present: false)
      end
    end
    redirect_to user_path(current_user.id)
  end

  private

  def set_dt
    @dt = DismissalType.find(params[:id])
    authorize @dt
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def dismissal_params
    params.require(:dismissal_type).permit(:name)
  end
end
