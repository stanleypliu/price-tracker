class PriceHistory < ApplicationRecord
  belongs_to :product
  belongs_to :site
end

