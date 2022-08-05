class PortfoliosController < ApplicationController
  
  def new
    @portfolio = Portfolio.new()
    @tickers = Array.new()
    3.times do @tickers.push(Ticker.new()) end
    # binding.pry
  end
  
  def create
    @portfolio = Portfolio.new(portfolio_paramas)
    @portfolio.save
  end

  def show
    @portfolio = Portfolio.find(params[:id])
    @tickers = Ticker.where(portfolio_id: @portfolio.id)
    @values = StockValue.joins("INNER JOIN tickers ON stock_values.ticker = tickers.ticker")
  end

  def update
  end

  def destroy
  end
  
  private
    def portfolio_paramas
      params.require(:portfolio).permit(:title, :user_id)
    end
  
end
