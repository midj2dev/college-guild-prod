class ChangePrisonerPrisonIdToString < ActiveRecord::Migration
  def change
    change_column :prisoners, :prison_id, :string
  end
end
