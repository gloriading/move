class RemoveDurationFromExercises < ActiveRecord::Migration[5.1]
  def change
    remove_column :exercises, :duration, :integer
  end
end
