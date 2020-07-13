class CreatePrisoners < ActiveRecord::Migration
  def change
    create_table :prisoners do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :cell_number
      t.date :enrollment_date
      t.string :mailing_restrictions
      t.date :dob
      t.string :education
      t.string :comments

      t.timestamps null: false
    end
  end
end
