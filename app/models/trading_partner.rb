class TradingPartner < ApplicationRecord
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"
  has_many :orders

  validates :buyer_id, presence: true
  validates :seller_id, presence: true
end
