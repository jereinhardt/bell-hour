class AddGradeToDepartment < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :grade, :boolean
  end
end
