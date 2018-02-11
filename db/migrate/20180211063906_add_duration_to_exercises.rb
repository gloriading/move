class AddDurationToExercises < ActiveRecord::Migration[5.1]
  def change
    add_column :exercises, :duration, :integer
  end
end
