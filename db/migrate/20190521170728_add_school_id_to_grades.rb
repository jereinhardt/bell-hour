class AddSchoolIdToGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :grades, :school_id, :integer
  end
end
