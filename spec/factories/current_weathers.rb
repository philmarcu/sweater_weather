FactoryBot.define do
  factory :current_weather do
    datetime { Time.now.to_s }
    sunrise { Time.now.to_s }
    sunset { Time.now.to_s }
    temp { Faker::Number.decimal(l_digits: 2) }
    feels_like { Faker::Number.decimal(l_digits: 2) }
    humidity { Faker::Number.number(digits: 2) }
    uvi { Faker::Number.number(digits: 1) }
    visibility { 10000 }
    conditions { "clear sky" }
    icon { "01n" }
  end
end
