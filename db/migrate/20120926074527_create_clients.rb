class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :contact_name
      t.string :contact_surname
      t.string :email
      t.references :user

      t.timestamps
    end
    add_index :clients, :user_id
  end
end
