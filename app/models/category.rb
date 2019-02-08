class Category < ApplicationRecord

  enum categories: {
    normal: 0,
    ladies: 1,
    mens: 2,
    baby_kids: 3,
    interia: 4,
    pleasure: 5,
    toys: 1328,
    cosmetic: 6,
    appliance: 7,
    orientation: 8,
    handmade: 9,
    tickets: 1027,
    cars: 1318,
    others: 10
  }
end
