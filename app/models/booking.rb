class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :brewery

  validates :end_date, comparison: { greater_than: :start_date }
  validates :rating, numericality: { included: 1..5 }
end
