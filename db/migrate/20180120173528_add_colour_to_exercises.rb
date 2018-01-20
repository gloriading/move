class AddColourToExercises < ActiveRecord::Migration[5.1]
  def change
    add_reference :exercises, :colour, foreign_key: true, index: true
  end
end
