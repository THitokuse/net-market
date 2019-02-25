class MiddleCategory < ApplicationRecord
  has_many :items
  belongs_to :upper_category
  has_many :lower_categories
  belongs_to :size_type
end

