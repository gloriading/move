class User < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_shares, through: :likes, source: :share
  has_many :screenshots, dependent: :destroy

  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, :last_name, presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

  before_save :capitalize
  before_create :generate_api_key

  private

    def generate_api_key
      loop do
        self.api_key = SecureRandom.hex(32)
        break unless User.exists?(api_key: api_key)
      end
    end

    def capitalize
      self.first_name.try(:capitalize!)
      self.last_name.try(:capitalize!)
    end

end
