# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lady = Category.create(name:"レディース")
mens = Category.create(name:"メンズ")
baby = Category.create(name:"ベビー・キッズ")
interior = Category.create(name:"インテリア・住まい・小物")
book = Category.create(name:"本・音楽・ゲーム")
toy = Category.create(name:"おもちゃ・ホビー・ゲーム")
beauty = Category.create(name:"コスメ・香水・美容")

lady_tops = lady.children.create(name:"トップス")
lady_jacket = lady.children.create(name:"ジャケット/アウター")
lady_pantsu = lady.children.create(name:"パンツ")

lady_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
lady_jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
lady_pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

mens_tops = mens.children.create(name:"トップス")
mens_jacket = mens.children.create(name:"ジャケット/アウター")
mens_pantsu = mens.children.create(name:"パンツ")

mens_tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
mens_jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
mens_pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ワークパンツ/カーゴパンツ"},{name:"その他"}])