class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.text :content
      t.string :image
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
