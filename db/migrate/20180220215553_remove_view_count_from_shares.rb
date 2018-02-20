class RemoveViewCountFromShares < ActiveRecord::Migration[5.1]
  def change
    remove_column :shares, :view_count, :integer
  end
end
