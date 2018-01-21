class RemoveColourFromExercises < ActiveRecord::Migration[5.1]
  def change
    remove_reference :exercises, :colour, foreign_key: true, index: true
  end
end
