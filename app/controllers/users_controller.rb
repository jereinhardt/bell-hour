class UsersController < ApplicationController
  before_action :set_school
  enforce_signed_out_only only: [:new, :create]

  def show
    @students = current_user.students
  end

  def new
    skip_authorization
    if user_candidate.user.present?
      redirect_to(root_path) and return
    end
    @user = User.build_from_candidate(user_candidate)
  end

  def create
    skip_authorization
    user_creation = UserCreation.new(user_candidate, user_params)
    if user_creation.perform
      sign_in(user_creation.user)
      flash[:notice] = t(".success")
      redirect_to root_path
    else
      @user = user_creation.user
      render "new"
    end
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
      :photo,
      :password,
      :password_confirmation
    ).merge(predetermined_params)
  end

  def predetermined_params
    {
      school: @school,
      photo: User::DEFAULT_PHOTO
    }
  end

  def user_candidate
    @user_candidate ||=
      @school.user_candidates.find_by!(uuid: params[:uuid])
  end
end
