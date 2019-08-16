# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 親要素
ladys, mens, baby, interior= Category.create([{name:"レディース"},{name:"メンズ"},{name:"ベビー・キッズ"},{name:"インテリア・住まい・小物"}])

# レディース 子要素
tops, jacket, pantsu = ladys.children.create([{name:"トップス"},{name:"ジャケットアウター"},{name:"パンツ"}])
# レディース 孫要素
tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

# メンズ 子要素
tops, jacket, pantsu = mens.children.create([{name:"トップス"},{name:"ジャケットアウター"},{name:"パンツ"}])
# メンズ 孫要素
tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

# ベビー・キッズ 子要素
babygirl, babyboby, babyboth = baby.children.create([{name:"ベビー服(女の子用)~95cm"},{name:"ベビー服(男の子用)~95cm"},{name:"ベビー服(男女兼用)~95cm"}])
# おもちゃ 孫要素
babygirl.children.create([{name:"トップス"}, {name:"アウター"},{name:"パンツ"},{name:"スカート"}])
babyboby.children.create([{name:"トップス"}, {name:"アウター"},{name:"パンツ"},{name:"おくるみ"}])
babyboth.children.create([{name:"トップス"}, {name:"アウター"},{name:"パンツ"},{name:"おくるみ"}])

# インテリア・住まい・小物 子要素
kitchen, bed, sofa, chair = interior.children.create([{name:"キッチン"},{name:"ベッド/マットレス"},{name:"ソファ/ソファベッド"},{name:"椅子/チェア"}])
# インテリア・住まい・小物 孫要素
kitchen.children.create([{name:"食器"}, {name:"調理器具"},{name:"収納/キッチン雑貨"},{name:"弁当用品"}])
bed.children.create([{name:"セミシングルベッド"}, {name:"シングルベッド"},{name:"セミダブルベッド"},{name:"ダブルベッド"}])
sofa.children.create([{name:"ソファセット"}, {name:"シングルソファ"},{name:"ラブソファ"},{name:"トリプルソファ"}])
chair.children.create([{name:"一般"}, {name:"スツール"},{name:"ダイニングチェア"},{name:"ハイバックチェア"}])
