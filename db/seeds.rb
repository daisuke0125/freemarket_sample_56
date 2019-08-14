# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lady, mens, hobby= Category.create([{name:"レディース"},{name:"メンズ"},{name:"おもちゃ"}])

tops, jacket, pantsu = lady.children.create([{name:"トップス"},{name:"ジャケットアウター"},{name:"パンツ"}])
tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

tops, jacket, pantsu = mens.children.create([{name:"トップス"},{name:"ジャケットアウター"},{name:"パンツ"}])
tops.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
jacket.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
pantsu.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])

toy, talent, comic = hobby.children.create([{name:"おもちゃ"},{name:"タレントグッズ"},{name:"コミック"}])
toy.children.create([{name:"Tシャツ/カットソー(半袖/袖なし)"}, {name:"Tシャツ/カットソー(七分/長袖)"},{name:"その他"}])
talent.children.create([{name:"テーラードジャケット"}, {name:"ノーカラージャケット"}, {name:"Gジャン/デニムジャケット"},{name:"その他"}])
comic.children.create([{name:"デニム/ジーンズ"}, {name:"ショートパンツ"},{name:"その他"}])