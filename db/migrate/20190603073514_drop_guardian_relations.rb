class DropGuardianRelations < ActiveRecord::Migration[5.2]
  def change
    drop_table :guardian_relations
  end
end
