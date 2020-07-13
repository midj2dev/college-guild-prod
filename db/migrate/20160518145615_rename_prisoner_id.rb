class RenamePrisonerId < ActiveRecord::Migration
  def change
    rename_column :prisoners, :prisoner_id, :prison_id
  end
end
