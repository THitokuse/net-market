class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  belongs_to :delivery_date
  belongs_to :delivery_burden
  belongs_to :delivery_method
  has_many :comments, dependent: :destroy
  belongs_to :upper_category, optional: true
  belongs_to :middle_category, optional: true
  belongs_to :lower_category, optional: true
  belongs_to :user
  belongs_to :brand
  has_one :order
  belongs_to :condition
  belongs_to :status

  accepts_nested_attributes_for :item_images

  include JpPrefecture
  jp_prefecture :prefecture_code



  # with_options presence: true do
  #   validates :name
  #   validates :price
  #   validates :prefecture_code
  #   validates :content
  #   validates :status
  #   validates :upper_category_id
  #   validates :middle_category_id
  #   validates :lower_category_id
  #   validates :size_id
  #   validates :delivery_burden_id
  #   validates :delivery_date_id
  #   validates :delivery_method_id
  # end
end
