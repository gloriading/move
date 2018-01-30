class Exercise < ApplicationRecord
  has_many :links, dependent: :destroy
  has_many :records, through: :links


  # belongs_to :user

  validates :name, presence: true
  validates :colour, presence: true

  after_save :titleize

  private
  def titleize
     self.name = name.titleize if name.present?
  end
end
