class RemoveParentDepartmentFromDepartments < ActiveRecord::Migration[5.2]
  def change
    remove_column :departments, :parents_department, :boolean
  end
end
