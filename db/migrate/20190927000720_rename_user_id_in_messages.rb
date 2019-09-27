class RenameUserIdInMessages < ActiveRecord::Migration[5.2]
  def change
    rename_column :messages, :user_id, :sender_id
  end
end
