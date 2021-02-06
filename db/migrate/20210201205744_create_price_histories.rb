class CreatePriceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :price_histories do |t|
      t.decimal :price, precision: 6, scale: 2
      t.date :date
      t.belongs_to :product

      t.timestamps
    end
  end
end
