class StockValue < ApplicationRecord
  def value_at_the_begd(ticker)
    return StockValue.find_by(ticker: ticker).order('date ASC').first
  end
  
  def latest_value(ticker)
    return StockValue.find_by(ticker: ticker).order('date DESC').first
  end
  
  def ytd_growht(ticker)
    return this.latest_value(ticker) / this.value_at_the_beg(ticker)  
  end
end
