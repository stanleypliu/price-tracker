FactoryBot.define do
  factory :site do
    factory :correct_site do
      url { 'https://www.google.com' }
      name { 'Google' }
    end 

    factory :invalid_site do 
      url { 'xdfesf' }
      name { 'Invalid!' }
    end
  end
end