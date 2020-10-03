class AddColumnToNouns < ActiveRecord::Migration[6.0]
  def change
    add_column :nouns, :vn_explanation, :text
    add_column :nouns, :nn_none_explanation, :text
    add_column :nouns, :nn_singular_explanation, :text
    add_column :nouns, :nn_plural_explanation, :text
  end
end
