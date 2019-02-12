crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link 'マイページ', root_path
  parent :root
end

crumb :show do
  link '商品名', item_path(1)
  parent :root
end

crumb :logout do
  link 'ログアウト', mypage_path(1)
  parent :mypage
end
