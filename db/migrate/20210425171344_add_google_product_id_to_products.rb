class AddGoogleProductIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :google_product_id, :string
  end
end
