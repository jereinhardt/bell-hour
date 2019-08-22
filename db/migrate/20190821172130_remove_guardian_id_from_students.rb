class RemoveGuardianIdFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :guardian_id, :integer
  end
end
