class Colour < ApplicationRecord
  has_many :exercises, dependent: :nullify
end
