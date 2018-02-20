class ChangeLikeCountToViewCount < ActiveRecord::Migration[5.1]
  def change
    rename_column :shares, :like_count, :view_count
  end
end
