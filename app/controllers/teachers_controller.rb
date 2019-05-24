class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    set_teacher
  end

  private

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end
end
