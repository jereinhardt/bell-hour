class DepartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(:school => user.school)
    end
  end

  def show?
    record.school == user.school
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
end
