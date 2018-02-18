class Like < ApplicationRecord
  belongs_to :share
  belongs_to :user
  validates :user_id, uniqueness: { scope: :share_id }
end
