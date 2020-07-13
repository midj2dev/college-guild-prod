class AddScanToUnits < ActiveRecord::Migration
  def change
    add_column :units, :scan, :string
  end
end
