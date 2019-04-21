FactoryBot.define do
  factory :ladies_item do
    name               {Faker::Pokemon.name}
    price              {5000}
    prefecture_code    {1}
    content            {Faker::Pokemon.name}
    created_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
    updated_at         {Faker::Time.between(2.days.ago, Time.now, :all)}
    size_id            {1}
    upper_category_id  {1}
    middle_category_id {1}
    lower_category_id  {1}
    brand_id           {1}
    delivery_burden_id {1}
    delivery_date_id   {1}
    delivery_method_id {1}
    user_id            {1}
    condition_id       {1}
    status_id          {1}
    purchase_status    {1}
  end
end