class AddSchoolIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :school_id, :integer
  end
end
