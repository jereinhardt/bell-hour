class DepartmentsController < ApplicationController
  before_action :set_school, only: [:new, :create]
  before_action :set_department, except: [:index, :new, :create]

  def index
    @departments = policy_scope(Department) #.order(id: :asc) <-- example
  end

  def show
    authorize @department
  end

  def new
    set_school
    @department = Department.new
    @department.school = @school
    authorize @department
  end

  def create
    set_school
    @department = @school.departments.build(department_params)
    authorize @department
    @department.save
    redirect_to new_school_department_path(current_user.school_id)
  end

  def edit
    authorize @department
  end

  def update
    authorize @department
    @department.update(department_params)
    redirect_to new_school_department_path(current_user.school_id)
  end

  def destroy
    authorize @department
    @department.destroy
    redirect_to new_school_department_path(current_user.school_id)
  end

  private

  def set_department
    @department = Department.find(params[:id])
    authorize @department
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def department_params
    params.require(:department).permit(:name, :grade)
  end
end
