class CreateVouchers < ActiveRecord::Migration[6.0]
  def change
    create_table :vouchers do |t|
      t.integer :saving
      t.date :expiry_date
      t.belongs_to :site
      
      t.timestamps
    end
  end
end
