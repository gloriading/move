class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.references :record, foreign_key: true, index: true
      t.references :exercise, foreign_key: true, index: true

      t.timestamps
    end
  end
end
