Dir["#{Rails.root}/spec/strategies/*.rb"].sort.each do |file|
  require file

  filename = File.basename(file, File.extname(file))
  strategy = filename.delete_suffix('_strategy').to_sym
  strategy_name = filename.camelize.constantize

  FactoryBot.register_strategy(strategy, strategy_name)
end
