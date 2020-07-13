class AddSpecialToReports < ActiveRecord::Migration[5.0]
  def change
    add_column :reports, :special, :boolean, default: false
  end
end
