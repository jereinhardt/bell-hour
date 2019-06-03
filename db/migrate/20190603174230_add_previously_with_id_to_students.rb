class AddPreviouslyWithIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :previously_with_id, :integer
  end
end
