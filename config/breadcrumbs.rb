crumb :root do
  link "メルカリ", root_path
end

crumb :show_item do |item|
  link "#{item.name}", items_path
  parent :root
end

crumb :users_show do |user|
  link "マイページ", users_show_path
  parent :root
end

crumb :users_profile do |user|
  link "プロフィール", users_profile_path
  parent :users_show
end

crumb :users_address do |user|
  link "住所変更", users_address_path
  parent :users_show
end

crumb :users_credit do |user|
  link "支払方法", users_credit_path
  parent :users_show
end

crumb :users_identification do |user|
  link "本人情報の登録", users_identification_path
  parent :users_show
end

crumb :users_card_create do |user|
  link "クレジットカード情報の登録", users_card_create_path
  parent :users_show
end

crumb :users_sign_out do |user|
  link "ログアウト", users_sign_out_path
  parent :users_show
end

crumb :search_items do |user|
  link "#{params[:q][:name_cont]}", search_items_path
  parent :root
end
