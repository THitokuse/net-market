FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    nickname           {Faker::Pokemon.name}
    email               {Faker::Internet.email}
    password            {password}
    password_confirmation {password}
    first_name          {Faker::Name.first_name}
    last_name           {Faker::Name.last_name}
    first_name_kana     {Faker::Name.first_name}
    last_name_kana      {Faker::Name.last_name}
    tel                 {Faker::PhoneNumber.phone_number}
    prefecture_code     {Faker::Address.state}
    zip                 {Faker::Address.zip_code}
    city_name           {Faker::Address.city}
    street              {Faker::Address.street_name}
    birth_day           {Faker::Number.number}
    birth_year          {Faker::Number.number}
    birth_month         {Faker::Number.number}
    self_introduce      {Faker::Lorem.word}
  end
end
