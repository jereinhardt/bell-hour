class DropWithTeacherRelations < ActiveRecord::Migration[5.2]
  def change
    drop_table :with_teacher_relations
  end
end
