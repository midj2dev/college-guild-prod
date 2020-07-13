class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.references :course, index: true, foreign_key: true
      t.date :mailing_date
      t.references :prisoner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
