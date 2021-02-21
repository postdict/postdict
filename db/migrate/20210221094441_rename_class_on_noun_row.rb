class RenameClassOnNounRow < ActiveRecord::Migration[6.1]
  def change
    remove_column :noun_rows, :class

    add_column :noun_rows, :css_class, :text;
  end
end
