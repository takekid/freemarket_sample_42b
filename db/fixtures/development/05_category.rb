Category.seed do |s|
s.id = 1
s.category_name = 'レディース'
end

Category.seed do |s|
s.id = 2
s.category_name = 'メンズ'
end

Category.seed do |s|
s.id = 3
s.category_name = 'ベビー・キッズ'
end

Category.seed do |s|
s.id = 4
s.category_name = 'インテリア・住まい・小物'
end

Category.seed do |s|
s.id = 5
s.category_name = '本・音楽・ゲーム'
end

Category.seed do |s|
s.id = 6
s.category_name = 'おもちゃ・ホビー・グッズ'
end

Category.seed do |s|
s.id = 7
s.category_name = 'コスメ・香水・美容'
end

Category.seed do |s|
s.id = 8
s.category_name = 'スポーツ・レジャー'
end

Category.seed do |s|
s.id = 9
s.category_name = 'ハンドメイド'
end

Category.seed do |s|
s.id = 10
s.category_name = 'チケット'
end

Category.seed do |s|
s.id = 11
s.category_name = '自動車・オートバイ'
end

Category.seed do |s|
s.id = 12
s.category_name = 'その他'
end

Category.seed do |s|
s.id = 110
s.category_name = 'トップス'
s.perent_id = 1
end

Category.seed do |s|
s.id = 111
s.category_name = 'ジャケット/アウター'
s.perent_id = 1
end

Category.seed do |s|
s.id = 112
s.category_name = 'パンツ'
s.perent_id = 1
end

Category.seed do |s|
s.id = 1110
s.category_name = 'Tシャツ'
s.perent_id = 110
end

Category.seed do |s|
s.id = 1111
s.category_name = 'キャミソール'
s.perent_id = 110
end

Category.seed do |s|
s.id = 1112
s.category_name = 'ポロシャツ'
s.perent_id = 110
end
