class Exercise < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :records, through: :links
  belongs_to :workout, optional: true


  validates :name, presence: true, length: { maximum: 15, message: "maximum is 15 characters" }
  validates :colour, presence: true

  before_save :name_downcase

  private
  def name_downcase
     self.name = name.downcase if name.present?
  end
end
