class ChangeDismissalTypeIdInStudents < ActiveRecord::Migration[5.2]
  def change
    change_column :students,
      :dismissal_type_id,
      'integer USING CAST(dismissal_type_id AS integer)'
  end
end
