class AddReferencesToToolsCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :tools_categories, :tool, null: false, foreign_key: true
    add_reference :tools_categories, :category, null: false, foreign_key: true
  end
end
