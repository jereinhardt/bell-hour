class UserCandidatePolicy < ApplicationPolicy
  def new?
    user_is_admin_of_school?
  end

  def create?
    user_is_admin_of_school?
  end

  private

  def user_is_admin_of_school?
    record.school == user.school && user.admin?
  end
end