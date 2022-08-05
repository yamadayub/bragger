class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.boolean :primary

      t.timestamps
    end
  end
end
