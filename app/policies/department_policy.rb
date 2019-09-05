class DepartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(:school => user.school)
    end
  end

  def show?
    record.school == user.school
  end
end
