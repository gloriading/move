class Workout < ApplicationRecord
  has_many :exercises, dependent: :nullify
  validates :name, presence: true, length: { in: 2..15 }, uniqueness: true

  before_save :name_downcase

  private
  def name_downcase
     self.name = name.downcase
  end

end
