class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.references :course, index: true, foreign_key: true
      t.references :prisoner, index: true, foreign_key: true
      t.references :volunteer, index: true, foreign_key: true
      t.date :mailing_date

      t.timestamps null: false
    end
  end
end
