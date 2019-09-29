class MessagePolicy < ApplicationPolicy
  def create?
    record.sender == user
  end
end
