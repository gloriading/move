class DropWorkoutsTable < ActiveRecord::Migration[5.1]
  def change
    def up
      drop_table :workouts
    end
    def down
      create_table :workouts
    end
  end
end
