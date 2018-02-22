class RemoveScreenshotFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :screenshot, :string
  end
end
