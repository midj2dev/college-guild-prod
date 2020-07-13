class AddCommentsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :comments, :string
  end
end
