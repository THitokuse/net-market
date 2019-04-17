class Credit < ApplicationRecord
  belongs_to :user

  def self.get_years
    ['2020', '2021', '2022']
  end

  def self.get_months
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
  end

  def set_year
    '20' + year
  end
end
