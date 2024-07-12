class Tool < ApplicationRecord
  belongs_to :user
  has_many :tools_categories, dependent: :destroy
  has_many :categories, through: :tools_categories


  has_many :bookings, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :price_per_day, numericality: { greater_than_or_equal_to: 0 }

  has_one_attached :image

  accepts_nested_attributes_for :tools_categories
end
