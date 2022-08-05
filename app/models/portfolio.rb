class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :tickers
  
  def ytd_return
    # @tickers = Ticker.where(portfolio_id: self.id)
    # @values = StockValue.joins("INNER JOIN tickers ON stock_values.ticker = tickers.ticker")
    # @initial_values = {"SPXL" => 100, "WEBL" => 100, "TECL" => 100}
    # @latest_values = {"SPXL" => 150, "WEBL" => 200, "TECL" => 250}
    # @ytd_growth = {"SPXL" => 0.50, "WEBL" => 1.00, "TECL" => 1.50}
    # @ytd_portfolio = {"SPXL" => [0.5, 0.50],"WEBL" => [0.4, 1.00], "TECL" => [0.1, 1.50]}
    ticker = Ticker.where(portfolio_id: self.id)
    
    initial_values = {}
    latest_values = {}
    ytd_growth = {}
    ytd_portfolio = {}
    
    ticker.each do |t|
      initial_values.store(t.ticker, StockValue.where(ticker: t.ticker).order(:date).first.value)
      latest_values.store(t.ticker, StockValue.where(ticker: t.ticker).order(:date).last.value)
      ytd_growth.store(t.ticker, latest_values[t.ticker].quo(initial_values[t.ticker]).to_f - 1)
      ytd_portfolio.store(t.ticker, [t.ratio ,ytd_growth[t.ticker]])
    end
    
    ytd_portfolio.sum do |key, value| value[0]*value[1] end
  end
  
  def rank
  end

end

