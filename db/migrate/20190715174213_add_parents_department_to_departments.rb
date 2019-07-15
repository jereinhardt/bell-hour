class AddParentsDepartmentToDepartments < ActiveRecord::Migration[5.2]
  def change
    add_column :departments, :parents_department, :boolean
  end
end
