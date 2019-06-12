class ChangeDismissalTypeIdInStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :students, :dismissal_type_id, :integer
  end
end
