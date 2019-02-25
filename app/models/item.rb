class Item < ApplicationRecord
  has_many :item_images
  belongs_to :delivery_date
  belongs_to :delivery_burden
  belongs_to :delivery_method
  has_many :comments
  belongs_to :upper_category, optional: true
  belongs_to :middle_category, optional: true
  belongs_to :lower_category, optional: true

  accepts_nested_attributes_for :item_images

  enum status: {
    default: 0,
    new_item: 1,
    nearly_new: 2,
    no_injure_clearly: 3,
    have_injure_clearly: 4,
    have_injure: 5,
    bad_condition: 6
  }

  enum prefecture_code: {
    common: 0,
    Hokkaido: 1,
    Aomori: 2,
    Iwate: 3,
    Miyagi: 4,
    Akita: 5,
    Yamagata: 6,
    Fukushima: 7,
    Ibaragi: 8,
    Tochigi: 9,
    Gunma: 10,
    Saitama: 11,
    Tiba: 12,
    Tokyo: 13,
    Kanagawa: 14,
    Niigata: 15,
    Toyama: 16,
    Ishikawa: 17,
    Fukui: 18,
    Yamanashi: 19,
    Nagano: 20,
    Gifu: 21,
    Shizuoka: 22,
    Aichi: 23,
    Mie: 24,
    Shiga: 25,
    Kyoto: 26,
    Osaka: 27,
    Hyogo: 28,
    Nara: 29,
    Wakayama: 30,
    Tottori: 31,
    Shimane: 32,
    Okayama: 33,
    Hiroshima: 34,
    Yamaguchi: 35,
    Tokushima: 36,
    Kagawa: 37,
    Ehime: 38,
    Kouchi: 39,
    Fukuoka: 40,
    Saga: 41,
    Nagasaki: 42,
    Kumamoto: 43,
    Ooita: 44,
    Miyazaki: 45,
    Kagoshima: 46,
    Okinawa: 47,
    Unknown: 99
  }


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
