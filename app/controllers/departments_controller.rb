class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def show
    set_department
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end
end
