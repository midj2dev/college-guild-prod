class AddReturnDateToUnits < ActiveRecord::Migration
  def change
    add_column :units, :return_date, :date
  end
end
