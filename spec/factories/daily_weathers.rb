FactoryBot.define do
  factory :daily_weather do
    date { Time.now.to_s }
    sunrise { Time.now.to_s }
    sunset { Time.now.to_s }
    max_temp { Faker::Number.decimal(l_digits: 2) }
    min_temp { Faker::Number.decimal(l_digits: 2) }
    conditions { ["cloudy", "clear sky", "rainy"].sample }
    icon { Faker::String.random(length: 3) }
  end
end
