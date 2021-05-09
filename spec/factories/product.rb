FactoryBot.define do
  factory :product do 
    sequence(:name) { |n| "test product #{n}" }

    factory :static_product do 
      name { 'Product' }
    end

    factory :blank_name_product do 
      name { '' }
    end
  end
end