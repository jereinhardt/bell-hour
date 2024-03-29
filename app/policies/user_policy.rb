class UserPolicy < ApplicationPolicy
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

  end

  def give_class_to?
    record.school == user.school && user.teacher
  end
end
