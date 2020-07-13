class AddDatesToUnits < ActiveRecord::Migration
  def change
    add_column :units, :reader_mailing_date, :date
    add_column :units, :reader_return_date, :date
  end
end
