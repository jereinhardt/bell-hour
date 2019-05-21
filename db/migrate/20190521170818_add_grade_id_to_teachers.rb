class AddGradeIdToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :grade_id, :integer
  end
end
