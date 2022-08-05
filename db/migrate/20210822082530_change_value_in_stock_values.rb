class ChangeValueInStockValues < ActiveRecord::Migration[5.2]
  def change
    change_column :stock_values, :value, :decimal, precision: 20, scale: 4
  end
end
