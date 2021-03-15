FactoryBot.define do
  factory :site do
    factory :correct_site do
      url { 'https://www.google.com' }
      name { 'Google' }
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