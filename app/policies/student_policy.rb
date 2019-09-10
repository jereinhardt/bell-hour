class StudentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(:school => user.school)
    end
  end

  def show?
    record.school == user.school
  end

  def dismiss?
    record.school == user.school && record.with_teacher == user || user.admin
  end

  def mark_present?
    record.school == user.school && record.teacher == user || user.admin
  end

  def take_attendance?
    record.school == user.school && record.teacher == user || user.admin
  end

  def take?
    record.school == user.school && record.with_teacher != user
  end

  def send_to_teacher?
    record.school == user.school && record.with_teacher == user
  end

  def take_back_class?
    record.teacher == user
  end
end
