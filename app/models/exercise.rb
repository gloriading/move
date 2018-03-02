class Exercise < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :records, through: :links


  validates :name, presence: true, length: { in: 2..15 }
  validates :colour, presence: true

  before_save :name_downcase

  private
  def name_downcase
    # guard clause
    return if name.blank?
    self.name = name.downcase
  end
end
