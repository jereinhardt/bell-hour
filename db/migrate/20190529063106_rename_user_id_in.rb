class RenameUserIdIn < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :user_id, :teacher_id
  end
end
