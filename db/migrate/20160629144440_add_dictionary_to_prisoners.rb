class AddDictionaryToPrisoners < ActiveRecord::Migration
  def change
    add_column :prisoners, :dictionary, :boolean
    add_column :prisoners, :dictionary_sent, :date
  end
end
