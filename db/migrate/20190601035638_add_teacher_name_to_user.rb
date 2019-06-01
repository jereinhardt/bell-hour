class AddTeacherNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :teacher_name, :string
  end
end
