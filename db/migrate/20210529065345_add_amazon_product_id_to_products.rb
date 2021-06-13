class AddAmazonProductIdToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :amazon_product_id, :string
  end
end
