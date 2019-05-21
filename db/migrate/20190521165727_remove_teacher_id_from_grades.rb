class RemoveTeacherIdFromGrades < ActiveRecord::Migration[5.2]
  def change
    remove_column :grades, :teacher_id, :integer
  end
end
