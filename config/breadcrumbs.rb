crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link 'マイページ', root_path
  parent :root
end

crumb :show do
  link 'ViVinne Westwood キーケース', item_path(1)
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
