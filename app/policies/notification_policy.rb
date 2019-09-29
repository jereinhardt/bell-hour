class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(recipient: user).unread
    end
  end

  def update?
    record.count == record.where(recipient: user).count
  end
end
