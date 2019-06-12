class CreateDismissalTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :dismissal_types do |t|
      t.string :name
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
