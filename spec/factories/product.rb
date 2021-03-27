FactoryBot.define do
  factory :product do 
    sequence(:name) { |n| "test product #{n}" }
  end
end