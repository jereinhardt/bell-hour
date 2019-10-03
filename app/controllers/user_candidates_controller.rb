class UserCandidatesController < ApplicationController
  before_action :set_school

  def new
    @user_candidate =
      @school.user_candidates.new(photo: 'default_profile.jpg')
    authorize(@user_candidate)
  end

  def create
    @user_candidate = 
      @school.user_candidates.new(user_candidate_params)
    authorize(@user_candidate)
    if @user_candidate.save
      # send email
      flash[:success] = t(".success", email: @user_candidate.email)
      redirect_to school_user_candidates_path(@school)
    else
      flash[:info] = t(".error")
      render "new"
    end
  end

  private

  def set_school
    @school = School.find(params[:school_id])
  end

  def user_candidate_params
    params.require(:user_candidate).permit(
      :first_name,
      :last_name,
      :teacher_name,
      :email,
      :teacher,
      :department
    )
  end
end
