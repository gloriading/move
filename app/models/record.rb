class Record < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :exercises, through: :links
end
