class AddPresentToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :present, :boolean
  end
end
