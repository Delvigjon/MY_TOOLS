class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  has_one_attached :image

  validates :start_date, :end_date, presence: true
  before_save :total_price
end
