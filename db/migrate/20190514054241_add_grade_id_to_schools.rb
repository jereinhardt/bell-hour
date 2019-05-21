class AddGradeIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :grade_id, :integer
  end
end
