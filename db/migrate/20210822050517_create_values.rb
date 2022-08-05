class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|
      t.date :date
      t.decimal :value

      t.timestamps
    end
  end
end
