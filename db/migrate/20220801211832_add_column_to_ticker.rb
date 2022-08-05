class AddColumnToTicker < ActiveRecord::Migration[5.2]
  def change
     add_column :tickers, :register_flag, :integer
  end
end
