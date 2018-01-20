class Exercise < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :records, through: :links
  # belongs_to :user
end
