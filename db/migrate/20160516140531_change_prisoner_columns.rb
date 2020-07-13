class ChangePrisonerColumns < ActiveRecord::Migration
  def change
  	rename_column :prisoners, :mailing_restrictions, :city
  	rename_column :prisoners, :education, :state
  	remove_column :prisoners, :dob, :date
  	add_column :prisoners, :zip, :string
  end
end
