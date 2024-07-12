class ChangePricePerDayFromTools < ActiveRecord::Migration[7.1]
  def change
    change_column :tools, :price_per_day, :float
  end
end
