class Record < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :exercises, through: :links
  accepts_nested_attributes_for :exercises, allow_destroy: true

  validates :start_time, presence: true

end
