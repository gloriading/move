class Record < ApplicationRecord
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :exercises, through: :links
  accepts_nested_attributes_for :exercises, reject_if: lambda {|attributes| attributes['name'].blank?}
end
