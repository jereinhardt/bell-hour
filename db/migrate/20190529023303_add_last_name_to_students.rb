class AddLastNameToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :last_name, :string
  end
end
