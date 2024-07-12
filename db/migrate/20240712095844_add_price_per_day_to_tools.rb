class AddPricePerDayToTools < ActiveRecord::Migration[7.1]
  def change
    add_column :tools, :price_per_day, :decimal
  end
end
