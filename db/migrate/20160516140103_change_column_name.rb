class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :prisoners, :cell_number, :prisoner_id
  end
end
