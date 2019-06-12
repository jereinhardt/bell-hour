class AddSchoolIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :school_id, :integer
  end
end
