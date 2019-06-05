class RenameTransportationTypeInStudents < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :transportation_type, :dismissal_type
  end
end
