class RemoveStudentIdFromTeachers < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :student_id, :integer
  end
end
