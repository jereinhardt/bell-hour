class RenameDismissalTypeInStudents < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :dismissal_type, :dismissal_type_id
  end
end
