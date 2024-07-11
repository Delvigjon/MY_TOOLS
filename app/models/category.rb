class Category < ApplicationRecord
  has_many :tools_categories, dependent: :destroy
  has_many :tools, through: :tools_categories

  validates :name, presence: true
end
