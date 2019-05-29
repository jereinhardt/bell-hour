class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :name
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
