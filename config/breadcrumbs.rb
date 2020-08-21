crumb :root do
  link "Home", root_path
end

crumb :mypage do
  link "マイページ", user_registration_path
  parent :root
end

crumb :exhibiting do
  link "出品した商品-出品中", item_exhibiting_users_path
  parent :mypage
end

crumb :exhibit_product_confirmation do
  link "出品商品確認", item_path
  parent :exhibiting
end

crumb :root_exhibit_product_confirmation do |item|
  if current_user.id == item.seller_id
    link "出品商品確認", item_path
  else 
    link "購入可能商品", item_path
  end
end

crumb :purchase_details do |item|
  link "購入内容確認", item_path
  parent :root_exhibit_product_confirmation ,item
end

crumb :sold do
  link "出品した商品-売却済み", item_sold_users_path
  parent :mypage
end

crumb :purchaced do
  link "購入した商品-過去の取引", item_purchaced_users_path
  parent :mypage
end

crumb :member do
  link "会員情報 登録・変更", edit_profile_path
  parent :mypage
end

crumb :street_address do
  link "商品送付先住所 登録・変更", edit_product_address_path
  parent :mypage
end

crumb :mail_password do
  link "メール/パスワード変更", edit_user_registration_path
  parent :mypage
end

crumb :credit_confirmation do
  link "クレジットカード登録", credits_path
  parent :mypage
end

crumb :credit_registration do
  link "クレジットカード情報登録", new_credit_path
  parent :credit_confirmation
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :mypage
end

crumb :exhibition do
  link "出品ページ", new_item_path
  parent :root
end

crumb :like do
  link "いいね一覧", item_likes_path
  parent :root
end

crumb :search do
  link "検索結果一覧", search_items_path
  parent :root
end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).

# if controller_name == "items" and action_name == "index"
#   parent root
# else
#   parent exhibiting
# end