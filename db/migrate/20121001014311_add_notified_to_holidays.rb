class AddNotifiedToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :notified, :boolean, :default => false
  end
end
