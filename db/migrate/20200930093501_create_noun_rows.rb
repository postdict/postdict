class CreateNounRows < ActiveRecord::Migration[6.0]
  def change
    create_table :noun_rows do |t|
      t.string :noun_form_name
      t.text :vn_cell
      t.text :nn_none_cell
      t.text :nn_singular_cell
      t.text :nn_plural_cell

      t.timestamps
    end
  end
end
