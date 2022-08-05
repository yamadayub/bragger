class ChangeRatioInTickers < ActiveRecord::Migration[5.2]
  def change
    change_column :tickers, :ratio, :decimal, precision: 7, scale: 4
  end
end
