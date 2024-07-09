class Tool < ApplicationRecord
    belongs_to :user
    validates :name, presence: true
    validates :description, presence: true
    validates :city, presence: true
    has_one_attached :image
end
