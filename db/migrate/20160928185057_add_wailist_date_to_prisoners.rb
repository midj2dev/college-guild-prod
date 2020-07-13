class AddWailistDateToPrisoners < ActiveRecord::Migration
  def change
    add_column :prisoners, :waitlist_date, :date
  end
end
