class FixAddressPrisoners < ActiveRecord::Migration
  def change
  	rename_column :prisoners, :address, :address_1
  	add_column :prisoners, :address_2, :string
  end
end
