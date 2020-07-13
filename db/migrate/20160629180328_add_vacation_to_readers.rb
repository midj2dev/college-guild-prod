class AddVacationToReaders < ActiveRecord::Migration
  def change
    enable_extension "hstore"
    add_column :volunteers, :vacation, :hstore
    add_column :volunteers, :college, :string
    add_index :volunteers, :vacation, using: :gin
  end
end
