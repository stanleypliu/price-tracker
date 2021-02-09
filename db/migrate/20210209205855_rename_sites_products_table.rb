class RenameSitesProductsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :sites_products, :products_sites
  end
end
