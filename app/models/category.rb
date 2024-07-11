class Category < ApplicationRecord
  has_many :tools_categories, dependent: :destroy
  has_many :tools, through: :tools_categories
  has_one_attached :image

  validates :name, presence: true
end
