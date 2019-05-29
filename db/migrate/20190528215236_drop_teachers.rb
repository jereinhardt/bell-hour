class DropTeachers < ActiveRecord::Migration[5.2]
  def change
    drop_table :teachers
  end
end
