class CreateNouns < ActiveRecord::Migration[6.0]
  def change
    create_table :nouns do |t|
      t.string :noun
      t.text :nn_meaning
      t.text :vn_meaning

      t.timestamps
    end
  end
end
