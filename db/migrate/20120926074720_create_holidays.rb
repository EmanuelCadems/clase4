class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.string :description
      t.date :date
      t.references :user

      t.timestamps
    end
    add_index :holidays, :user_id
  end
end
