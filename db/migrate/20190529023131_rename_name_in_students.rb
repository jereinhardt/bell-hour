class RenameNameInStudents < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :name, :first_name
  end
end
