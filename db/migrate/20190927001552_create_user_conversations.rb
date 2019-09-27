class CreateUserConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_conversations do |t|
      t.belongs_to :user
      t.belongs_to :conversation
    end
  end
end
