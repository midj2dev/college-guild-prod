class AddReaderScanToUnits < ActiveRecord::Migration
  def change
    add_column :units, :reader_scan, :string
  end
end
