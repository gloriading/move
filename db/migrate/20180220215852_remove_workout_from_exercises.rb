class RemoveWorkoutFromExercises < ActiveRecord::Migration[5.1]
  def change
    remove_reference :exercises, :workout, foreign_key: true
  end
end
