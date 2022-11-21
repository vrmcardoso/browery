class Brewery < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates_length_of :description, :minimum => 6
end
