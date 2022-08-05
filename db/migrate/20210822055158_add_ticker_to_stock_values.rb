class AddTickerToStockValues < ActiveRecord::Migration[5.2]
  def change
    add_column :stock_values, :ticker, :string
  end
end
