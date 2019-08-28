crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", mypage_item_path(current_user), class: "crumb"
end

crumb :categories do
  link "カテゴリー一覧", categories_path
end

crumb :edit_select do
  link "出品した商品", edit_select_item_path(current_user)
  parent :mypage
end

crumb :card_registration do
  link "支払い方法", card_registration_item_path
  parent :mypage
end

crumb :identification do
  link "本人情報", identification_item_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_item_path
  parent :mypage
end
