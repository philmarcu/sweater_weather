FactoryBot.define do
  factory :hourly_weather do
    time { Time.now.to_s }
    temp { Faker::Number.decimal(l_digits: 2) }
    conditions { ["cloudy", "clear sky", "rainy"].sample }
    icon { Faker::String.random(length: 3) }
  end
end
