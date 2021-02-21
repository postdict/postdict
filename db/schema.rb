# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_21_094441) do

  create_table "noun_rows", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "noun_id"
    t.integer "row_num"
    t.text "content"
    t.integer "column_num"
    t.text "css_class"
  end

  create_table "nouns", force: :cascade do |t|
    t.string "noun"
    t.text "nn_meaning"
    t.text "vn_meaning"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "vn_explanation"
    t.text "nn_none_explanation"
    t.text "nn_singular_explanation"
    t.text "nn_plural_explanation"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "original_noun"
    t.text "sentence_jp"
    t.text "sentence_en"
    t.text "placeholder"
    t.text "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
    t.string "name"
  end

end
