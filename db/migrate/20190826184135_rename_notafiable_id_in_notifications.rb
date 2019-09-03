class RenameNotafiableIdInNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :notafiable_id, :notifiable_id
  end
end
