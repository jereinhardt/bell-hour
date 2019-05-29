class AddWithTeacherIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :with_teacher_id, :integer
  end
end
