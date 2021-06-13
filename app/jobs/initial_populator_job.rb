class InitialPopulatorJob < ApplicationJob 
  queue_as :default

  def perform(product)
    name = product.name

    amazon_id = AppServices::AmazonSearchService.new(name: name).call

    product.update({ amazon_product_id: amazon_id })
  end
end