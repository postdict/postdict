class CreatePrequizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :prequizzes do |t|
      t.string :original_noun
      t.text :sentence_jp
      t.text :sentence_en
      t.text :placeholder
      t.text :answer

      t.timestamps
    end
  end
end
