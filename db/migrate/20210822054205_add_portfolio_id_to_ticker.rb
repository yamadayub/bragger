class AddPortfolioIdToTicker < ActiveRecord::Migration[5.2]
  def change
      add_reference :tickers, :portfolio, foreign_key: true
  end
end
