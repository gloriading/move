class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.text :note
      t.integer :duration
      t.date :date

      t.timestamps
    end
  end
end
