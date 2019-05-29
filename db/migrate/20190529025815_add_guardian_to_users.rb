class AddGuardianToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :guardian, :boolean
  end
end
