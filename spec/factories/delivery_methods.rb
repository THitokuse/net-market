FactoryBot.define do
  factory :delivery_method do
    name               {Faker::Pokemon.name}
    created_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
    updated_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
  end
end