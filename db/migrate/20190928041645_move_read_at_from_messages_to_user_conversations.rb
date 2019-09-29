class MoveReadAtFromMessagesToUserConversations < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :read_at
    add_column :user_conversations, :read_at, :datetime
  end
end
