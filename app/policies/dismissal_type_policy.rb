class DismissalTypePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def dismiss_type_with?
    record.school == user.school
  end
end
