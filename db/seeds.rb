# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

csv_list = ['db/Tickers_NYSE.csv','db/Tickers_NASDAQ.csv','db/Tickers_AMEX.csv']

csv_list.each do |csv|
    CSV.foreach(csv) do |row|
      TickerSource.create(:ticker => row[1], :exchange => row [0], :name => row[2] )
    end
end