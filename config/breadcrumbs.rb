crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link 'マイページ', root_path
  parent :root
end

crumb :show do |item|
  link "#{item.name}", item_path(item)
  parent :root
end

crumb :logout do
  link 'ログアウト', mypage_path(1)
  parent :mypage
end

crumb :identify do
  link '本人情報の登録', identify_mypages_path
  parent :mypage
end

crumb :profile do
  link 'プロフィール', edit_mypage_path
  parent :mypage
end

crumb :card_registration do
 link '支払い方法', credits_path
 parent :mypage
end

crumb :selling do
  link '出品した商品 - 出品中', item_listing_mypages_path
  parent :mypage
end

crumb :selling_item do |item|
  link '商品出品画面', sell_item_item_path(item)
  parent :selling
end

crumb :simple_search do |keyword|
  link "#{keyword}", simple_searches_path(keyword)
  parent :root
end

crumb :multi_search do |search|
  link "#{params[:q][:sort_order_eq]} #{params[:q][:name_cont]} #{params[:q][:upper_category_id_eq]} #{params[:q][:middle_category_id_eq]} #{params[:q][:lower_category_id_eq]} #{params[:q][:brand_id_eq]} #{params[:q][:size_id_cont]} #{params[:q][:price_gteq]} ~ #{params[:q][:price_lteq]}", multi_searches_path(search)
end

crumb :categories do
  link 'カテゴリー一覧', categories_path
  parent :root
end

crumb :upper_category do |upper|
  link "#{upper.name}", upper_category_path(upper)
  parent :categories
end

crumb :middle_category do |middle|
  link "#{middle.name}", middle_category_path(middle)
  parent :upper_category, middle.upper_category
end

crumb :lower_category do |lower|
  link "#{lower.name}", lower_category_path(lower)
  parent :middle_category, lower.middle_category
end

crumb :credits_new do
  link 'クレジットカード情報入力', new_credit_path
  parent :card_registration
end

crumb :brands do
  link 'ブランド一覧', brands_path
  parent :root
end

crumb :brand do |brand|
  link "#{brand.name}", brand_path(brand)
  parent :brands
end
