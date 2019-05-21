class AddTeacherIdToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :teacher_id, :integer
  end
end
