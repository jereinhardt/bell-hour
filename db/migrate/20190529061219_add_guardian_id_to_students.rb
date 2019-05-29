class AddGuardianIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :guardian_id, :integer
  end
end
