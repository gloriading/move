class RemoveDurationFromRecords < ActiveRecord::Migration[5.1]
  def change
    remove_column :records, :duration, :integer
  end
end
