class RemoveGradeIdFromSchools < ActiveRecord::Migration[5.2]
  def change
    remove_column :schools, :grade_id, :integer
  end
end
