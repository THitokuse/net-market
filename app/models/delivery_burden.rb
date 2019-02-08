class DeliveryBurden < ApplicationRecord
  has_many :items

  enum burdens: {
    default: 0,
    seller_burden: 1,
    buyer_burden: 2
  }
end
