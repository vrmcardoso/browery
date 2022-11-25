class Brewery < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates_length_of :description, :minimum => 6
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
