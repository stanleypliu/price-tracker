FactoryBot.define do
  factory :site do
    factory :correct_site do
      url { 'https://www.google.com' }
      name { 'Google' }

      factory :site_with_products do 
        transient do
          products_count { 4 }
        end
  
        after(:create) do |correct_site, evaluator|
          create_list(:product, evaluator.products_count, sites: [correct_site])
          correct_site.reload
        end
      end
    end 

    factory :sequenced_site do 
      sequence(:name) { |n| "Site #{n}" }
      sequence(:url) { |n| "https://www.site#{n}.com" }

      factory :sequenced_site_with_products do
        transient do 
          products_count { rand(1..10) }
        end

        after(:create) do |sequenced_site, evaluator|
          create_list(:product, evaluator.products_count, sites: [sequenced_site])
          sequenced_site.reload
        end
      end
    end

    factory :invalid_url_site do 
      url { 'xdfesf' }
      name { 'Invalid!' }
    end

    factory :blank_name_site do 
      url { 'https://www.test.com' }
      name { '' }
    end
  end
end