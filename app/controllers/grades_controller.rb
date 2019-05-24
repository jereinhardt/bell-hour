class GradesController < ApplicationController

  def index
    @grades = Grade.all
  end

  def show
    set_grade
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

end
