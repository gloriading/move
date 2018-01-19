class Record < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :exercises, through: :links
end
