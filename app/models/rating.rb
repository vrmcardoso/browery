class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :brewery

  validates_uniqueness_of :brewery_id, :scope => :list_id
  validates :stars, presence: true
  validates :stars, numericality: { in: 1..5 }
end
