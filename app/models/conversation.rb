class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_conversations
  has_many :users, through: :user_conversations

  def self.between(sender, recipient)
    joins(:user_conversations).
      where(user_conversations: sender.user_conversations).
      where(user_conversations: { user: recipient }).
      first
  end

  def other_participating_user(user)
    users.where.not(id: user.id).first
  end

  def mark_as_read_by_user!(user)
    user_conversations.find_by(user: user).update!(read_at: Time.current)
  end

  def read_by_user?(user)
    last_message_sent_at =
      messages.where.not(sender: user).order(created_at: :desc).first.created_at
    user_last_read_at = user_conversations.find_by(user: user).last_read_at
    user_last_read_at > last_message_sent_at
  end
end
