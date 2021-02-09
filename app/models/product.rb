class Product < ApplicationRecord
  has_one :price_tracker
  has_and_belongs_to_many :sites
  has_many :vouchers, through: :sites
  has_many :price_histories

end
