class Tool < ApplicationRecord
    belongs_to :user
    has_many :tools_categories, dependent: :destroy
    has_many :categories, through: :tools_categories
  
    validates :name, presence: true
    validates :description, presence: true
    validates :city, presence: true
  
    has_one_attached :image
  
    accepts_nested_attributes_for :tools_categories
  end
  