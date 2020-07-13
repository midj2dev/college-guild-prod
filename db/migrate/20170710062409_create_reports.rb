class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.json :query
      t.string :model
      t.string :title
      t.json :result_records

      t.timestamps
    end
  end
end
