class UserCandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(school: user.school)
    end
  end

  def new?
    user_is_admin_of_school?
  end

  def create
    user_is_admin_of_school?
  end

  private

  def user_is_admin_of_school?
    record.school == user.school && user.admin?
  end
end