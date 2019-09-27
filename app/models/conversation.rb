class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_conversations
  has_many :users, through: :user_conversations

  scope :between, -> (sender_id, recipient_id) do
    # SELECT * FROM conversations
    #   JOIN user_conversations ON user_conversations.conversation_id = conversations.id
    #   WHERE user_conversations.user_id IN (#{sender_id}, #{recipient_id})
    joins(:user_conversations).
      where(user_conversations: { user_id: [sender_id, recipient_id] })
  end
end
