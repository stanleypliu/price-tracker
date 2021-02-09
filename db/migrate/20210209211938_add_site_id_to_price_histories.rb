class AddSiteIdToPriceHistories < ActiveRecord::Migration[6.0]
  def change
    add_column :price_histories, :site_id, :bigint
  end
end
