class DropColousTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :colours
  end
  def down
    create_table :colours
  end
end
