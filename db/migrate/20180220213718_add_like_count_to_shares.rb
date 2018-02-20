class AddLikeCountToShares < ActiveRecord::Migration[5.1]
  def change
    add_column :shares, :like_count, :integer
  end
end
