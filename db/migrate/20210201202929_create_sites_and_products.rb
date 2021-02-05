class CreateSitesAndProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url, null: false

      t.timestamps
    end

    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :sites_products, id: false do |t|
      t.belongs_to :site
      t.belongs_to :product
    end
  end
end
