class CreatePriceTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :price_trackers do |t|
      t.decimal :target_price, scale: 2
      t.time :update_frequency
      t.decimal :current_price, scale: 2
      t.belongs_to :product

      t.timestamps
    end
  end
end
