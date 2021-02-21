class RenewNounRowsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :noun_rows, :vn_cell;
    remove_column :noun_rows, :nn_none_cell;
    remove_column :noun_rows, :nn_singular_cell;
    remove_column :noun_rows, :nn_plural_cell;
    remove_column :noun_rows, :noun_form_name;

    add_column :noun_rows, :row_num, :integer;
    add_column :noun_rows, :column_num, :varchar;
    add_column :noun_rows, :class, :text;
  end
end
