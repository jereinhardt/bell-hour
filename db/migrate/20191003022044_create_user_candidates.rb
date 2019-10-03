class CreateUserCandidates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_candidates do |t|
      t.string :email, null: false
      t.boolean :teacher, null: false, default: false
      t.string :first_name
      t.string :last_name
      t.string :teacher_name
      t.string :photo
      t.string :uuid, null: false

      t.belongs_to :department
      t.belongs_to :school
      t.belongs_to :user

      t.timestamps
    end
  end
end
