class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :description
      t.string :city

      t.timestamps
    end
  end
end
