class UserCandidatesController < ApplicationController
  before_action :set_school

  def new
    @user_candidate =
      @school.user_candidates.new(photo: User::DEFAULT_PHOTO)
    authorize(@user_candidate)
    @departments = departments
  end

  def create
    @user_candidate = 
      @school.user_candidates.new(user_candidate_params)
    authorize(@user_candidate)
    if @user_candidate.save
      UserCandidateMailer.send_invitation(@user_candidate, current_user).deliver_later
      flash[:notice] = t(".success", email: @user_candidate.email)
      redirect_to new_school_user_candidate_path(@school)
    else
      @departments = departments
      flash[:alert] = t(".failure")
      render "new"
    end
  end

  private

  def set_school
    @school = School.
      includes(departments: :user_candidates).
      find(params[:school_id])
  end

  def departments
    @school.
      departments.
      with_user_candidates.
      grades_first.
      distinct
  end

  def user_candidate_params
    params.require(:user_candidate).permit(
      :first_name,
      :last_name,
      :teacher_name,
      :email,
      :teacher,
      :department_id
    )
  end
end
