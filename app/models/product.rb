class Product < ApplicationRecord
  has_many :price_trackers
  has_and_belongs_to_many :sites
  has_many :vouchers, through: :sites
  has_many :price_histories

  validates :name, presence: true, uniqueness: true
end
