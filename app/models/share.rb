class Share < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { in: 5..1000 }
end
