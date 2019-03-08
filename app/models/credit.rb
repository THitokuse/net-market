class Credit < ApplicationRecord
  belongs_to :user

  # :yearに対するバリデーション用正規表現作成にも使用、そのためvalidation前に以下のメソッドを記述
  def self.get_years
    # [2,2]で西暦の末2桁を取得して、数値型に再変換
    min_year = Time.new.year.to_s[2,2].to_i
    max_year = min_year + 10
    # 返り値は[19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
    return years = [*(min_year..max_year)]
  end

  def self.get_months
    ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
  end

  def set_year
    '20' + year
  end
end
