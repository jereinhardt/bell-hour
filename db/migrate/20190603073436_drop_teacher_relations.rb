class DropTeacherRelations < ActiveRecord::Migration[5.2]
  def change
    drop_table :teacher_relations
  end
end
