class GradesController < ApplicationController
  def index
    @grades = Grade.all
  end

  def show
    @teachers = @grade.teachers
  end

  private

  def set_grade

  end

end
