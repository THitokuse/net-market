class LowerCategory < ApplicationRecord
  belongs_to :middle_category
  has_many :items
end
