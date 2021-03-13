class Site < ApplicationRecord
  has_many :vouchers
  has_and_belongs_to_many :products
  has_many :price_histories

  validates :url, uniqueness: true, format: { with: URI.regexp }
  validates :name, uniqueness: true

end
