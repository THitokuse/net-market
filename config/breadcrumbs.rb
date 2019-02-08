crumb :root do
  link 'メルカリ', root_path
end

crumb :mypage do
  link 'マイページ', root_path
  parent :root
end

crumb :logout do
  link 'ログアウト', logout_path
  parent :mypage
end
