class RenameTeacherIdInStudents < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :teacher_id, :user_id
  end
end
