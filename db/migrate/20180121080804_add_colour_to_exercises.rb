class AddColourToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :colour, :string
  end
end
