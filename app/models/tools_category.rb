class ToolsCategory < ApplicationRecord
  belongs_to :tool
  belongs_to :category

  validates :tool_id, presence: true
  validates :category_id, presence: true
end
