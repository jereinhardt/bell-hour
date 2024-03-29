class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :faculty_id
      t.datetime :read_at
      t.string :action
      t.integer :notafiable_id
      t.string :notifiable_type

      t.timestamps
    end
  end
end
