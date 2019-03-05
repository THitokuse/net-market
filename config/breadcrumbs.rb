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
 link '支払い方法', card_registration_mypage_path
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
  link "#{keyword}", simple_search_items_path(keyword)
  parent :root
end

crumb :multi_search do |search|
  link "#{search}", multi_search_items_path(search)
end
