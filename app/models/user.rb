class User < ApplicationRecord
  has_many :records, dependent: :destroy
  # has_many :exercises, dependent: :nullify


  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, :last_name, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

  before_save :capitalize
  private
  def capitalize
    self.first_name.try(:capitalize!)
    self.last_name.try(:capitalize!)
  end
end
