class CreateTickerSources < ActiveRecord::Migration[5.2]
  def change
    create_table :ticker_sources do |t|
      t.string :ticker
      t.string :exchange

      t.timestamps
    end
  end
end
