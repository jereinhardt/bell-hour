class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.
        joins(user_conversations: :user).
        where(user_conversations: { user: user })
    end
  end

  def show?
    user_involved_in_conversation?
  end

  def create?
    user_involved_in_conversation?
  end

  private

  def user_involved_in_conversation?
    record.users.include?(user)
  end
end
