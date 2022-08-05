class ChangeValuesToStockValues < ActiveRecord::Migration[5.2]
  def change
    rename_table :values, :stock_values
  end
end
