class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(teacher: true)
    end
  end
end
