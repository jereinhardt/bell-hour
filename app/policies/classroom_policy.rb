class ClassroomPolicy < ApplicationPolicy
  def show?
    record.school == user.school
  end
end