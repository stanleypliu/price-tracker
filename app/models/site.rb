class Site < ApplicationRecord
  has_many :vouchers
  has_and_belongs_to_many :products
  has_many :price_histories

end
