class AddTransportationTypeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :transportation_type, :string
  end
end
