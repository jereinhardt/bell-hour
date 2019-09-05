class DepartmentsController < ApplicationController
  def index
    @departments = policy_scope(Department) #.order(id: :asc) <-- example
  end

  def show
    set_department
  end

  private

  def set_department
    @department = Department.find(params[:id])
    authorize @department
  end
end
