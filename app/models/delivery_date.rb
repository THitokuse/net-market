class DeliveryDate < ApplicationRecord
  has_many :items

  enum dates: {
    default: 0,
    one_or_two_days: 1,
    few_days: 2,
    to_a_week: 3
  }
end
