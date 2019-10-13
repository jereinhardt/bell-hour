class ClassroomsController < ApplicationController
  SHOW_DEFAULT = "default".freeze
  SHOW_DISMISSAL = "dismissal".freeze

  before_action :set_teacher_user

  def show
    authorize(@teacher_user)

    respond_to do |format|
      format.js
    end
  end

  private

  def set_teacher_user
    @teacher_user = User.find(params[:user_id])
  end

  def rendered_partial
    if params[:type] == SHOW_DEFAULT
      default_partial
    elsif params[:type] = SHOW_DISMISSAL
      "dismissal"
    end
  end

  helper_method :rendered_partial

  def default_partial
    if @teacher_user.department.grade
      "students"
    else
      "visiting"
    end
  end
end