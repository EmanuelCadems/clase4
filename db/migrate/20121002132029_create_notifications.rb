class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :client
      t.references :holiday

      t.timestamps
    end
    add_index :notifications, :client_id
    add_index :notifications, :holiday_id
  end
end
