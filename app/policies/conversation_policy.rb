class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(sender_id: user.id).or(Conversation.where(recipient_id: user.id))
    end
  end

  def create?
    record.sender == user || record.recipient == user
  end
end
