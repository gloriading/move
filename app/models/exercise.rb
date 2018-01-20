class Exercise < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :records, through: :links
  belongs_to :colour

  # belongs_to :user

  validates :name, presence: true

  after_initialize :assign_colour

  private
  def assign_colour
    self.colour = Colour.all.sample
  end
end
