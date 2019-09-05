class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(recipient: user).unread
    end
  end

  def mark_as_read?
    user
  end
end
