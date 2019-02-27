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
