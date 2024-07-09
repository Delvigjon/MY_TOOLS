class AddImageToTool < ActiveRecord::Migration[7.1]
  def change
    add_column :tools, :image, :string
  end
end
