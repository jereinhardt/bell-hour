class UsersController < ApplicationController
  before_action :set_user, except: [:take_back_class]
  before_action :set_school

  def show
    @students = current_user.students
  end

  def new
    user_candidate = UserCandidate.find_by!(uuid: params[:uuid])
    @user = User.from_candidate(user_candidate)
    authorize(@user)
  end

  def create
    user_creation =
      UserCreation.new(user_candidate: user_candidate, user_params)
    if user_creation.perform
      flash[:success] = t(".success")
      redirect_to root_path
    else
      @user = user_creation.user
      flash[:info] = t(".failure")
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def give_class_to
    current_user.students.each do |student|
      if student.with_teacher == current_user
        student.update(with_teacher_id: @user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  def take_back_class
    first_student = current_user.students.first
    authorize first_student
    current_user.students.each do |student|
      if student.with_teacher != current_user && student.present
        student.update(with_teacher_id: current_user.id)
      end
    end
    redirect_to user_path(current_user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def user_params
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name,
      :teacher_name,
      :admin,
      :teacher,
      :department_id,
      :photo
    ).merge(school: @school)
  end

  def user_candidate
    @user_candidate ||= UserCandidate.find_by(uuid: params[:uuid])
  end
end
