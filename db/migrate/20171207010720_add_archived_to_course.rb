class AddArchivedToCourse < ActiveRecord::Migration[5.0]
  def change
    add_column :courses, :archived, :boolean, default: false
  end
end
