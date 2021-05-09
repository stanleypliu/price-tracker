class InitialPopulatorJob < ApplicationJob 
  queue_as :default

  def perform(product)
    name = product.name

    google_id = AppServices::GoogleSearchService.new(name: name).call

    product.update({ google_product_id: google_id })
  end
end