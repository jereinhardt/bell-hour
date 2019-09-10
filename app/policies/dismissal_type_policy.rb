class DismissalTypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.school == user.school && user.admin
  end

  def update?
    record.school == user.school && user.admin
  end

  def destroy?
    record.school == user.school && user.admin
  end

  def dismiss_type_with?
    record.school == user.school
  end
end
