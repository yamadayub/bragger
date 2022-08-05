class Ticker < ApplicationRecord
  belongs_to :porfolio, optional: true
  has_many :stock_values, foreign_key: :ticker, primary_key: :ticker
  #paramの配列を作る
  REGISTRABLE_ATTRIBUTES = %i(ticker ratio portfolio_id register_flag)
end
