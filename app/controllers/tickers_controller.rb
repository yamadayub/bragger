class TickersController < ApplicationController

  def index
  end
  
  def new
    # Create Ticker Collection
    @tickers = Form::TickerCollection.new
  end
  
  def create
    @tickers = Form::TickerCollection.new(ticker_collection_params)
    # binding.pry
    if @tickers.save
      redirect_to tickers_path, notice: "#{@tickers.tickers.count{|t| t.register_flag ==1}}件の証券を登録しました。"
    else
      flash.now[:alert] = "証券登録に失敗しました"
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  private
  def ticker_collection_params
    params.require(:form_ticker_collection).permit(tickers_attributes: Ticker::REGISTRABLE_ATTRIBUTES )
  end
end
