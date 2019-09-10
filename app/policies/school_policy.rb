class SchoolPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(:id => user.school_id)
    end
  end
end
