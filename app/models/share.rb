class Share < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { in: 5..1000 }

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  include AASM

   aasm whiny_transitions: false do
       state :personal, initial: true
       state :published

       event :publish do
         transitions from: :personal, to: :published
       end

       event :recycle do
         transitions from: :published, to: :personal
       end

   end


end
