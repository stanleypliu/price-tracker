require_relative 'json_strategy'

class JsonAttributesStrategy < JsonStrategy 
  def initialize
    @strategy = FactoryBot.strategy_by_name(:attributes_for).new
  end
end