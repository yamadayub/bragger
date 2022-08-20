class AddColumnTickerSources < ActiveRecord::Migration[5.2]
  def change
    add_column :ticker_sources, :name, :string
  end
end
