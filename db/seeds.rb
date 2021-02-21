# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sale = Noun.create(noun: "sale", nn_meaning: "saleする/される", vn_meaning: "取引、sellする一連のプロセス、sellするイベント、売上")

noun_form_names = [
  "__ V",
  "__ BE",
  "V __",
  "BE __",
  "P __",
  "there BE __",
  "名詞句のみ"
]

sale.noun_rows.create(row_num: 0, column_num: 3, content: "♦Sales increased 24 percent.")
sale.noun_rows.create(row_num: 0, column_num: 3, css_class: "blue", content: "売り上げは24パーセント伸びた.")

Quiz.create(original_noun: "sale", sentence_jp: "政府は象牙の販売を禁止した。", sentence_en: "The company accounted for 90 percent of ( pen sale ) in the U.S.", placeholder: "pen sale", answer: "pen sales", kind: "pre")
Quiz.create(original_noun: "sale", sentence_jp: "その会社は米国の万年筆の売上の90%を占めた。", sentence_en: "The government imposed a ban on ( sale ) of ivory.", placeholder: "sale", answer: "the sale", kind: "pre")

Quiz.create(original_noun: "sale", sentence_jp: "売り上げ減で会社は財政困難に陥った。", sentence_en: "The company was embarrassed by the decline in ( sale ).", placeholder: "sale", answer: "sales", kind: "post")
Quiz.create(original_noun: "sale", sentence_jp: "シャロンはセールで安く選んだとてもすてきな家具をもっている。", sentence_en: "Sharon has some really nice furniture she picked up cheap in ( sale ).", placeholder: "sale", answer: "a [the] sale", kind: "post")
