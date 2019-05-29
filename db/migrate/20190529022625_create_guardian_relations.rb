class CreateGuardianRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :guardian_relations do |t|
      t.references :user, foreign_key: true
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
