class AddDisplayToScreenshots < ActiveRecord::Migration[5.1]
  def change
    add_column :screenshots, :display, :string
  end
end
