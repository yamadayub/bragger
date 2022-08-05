class Form::TickerCollection < Form::Base
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :tickers

  def initialize(attributes = {})
    super attributes
    self.tickers = DEFAULT_ITEM_COUNT.times.map { Ticker.new } unless tickers.present?
  end

   # 上でsuper attributesとしているので必要
  def tickers_attributes=(attributes)
    self.tickers = attributes.map { |_, v| Ticker.new(v) }
  end
  
  def save
    Ticker.transaction do
      self.tickers.each do |t|
        t.save! if t.register_flag == 1
      end
    end
    true
  end

end