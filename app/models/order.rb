class Order < ApplicationRecord
  belongs_to :item
  belongs_to :trading_partner

  validates :item_id, presence: true
  validates :trading_partner_id, presence: true
end
