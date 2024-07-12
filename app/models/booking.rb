class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  has_one_attached :image

  validates :start_date, :end_date, presence: true
  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = (end_date - start_date).to_i * tool.price_per_day
  end
end
