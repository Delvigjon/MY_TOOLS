class CreateToolsCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :tools_categories do |t|

      t.timestamps
    end
  end
end
