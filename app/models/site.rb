class Site < ApplicationRecord
  has_many :vouchers
  has_and_belongs_to_many :products
  has_many :price_histories

  validates :url, uniqueness: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :name, uniqueness: true, presence: true

  enum status: %i[pending accepted]

  scope :accepted_sites, -> { where(status: :accepted) }
  scope :top_sites, -> { accepted_sites.left_joins(:products).group('sites.id').order('count(products.id) desc') }
end
