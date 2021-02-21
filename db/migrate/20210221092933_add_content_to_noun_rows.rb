class AddContentToNounRows < ActiveRecord::Migration[6.1]
  def change
    remove_column :noun_rows, :column_num

    add_column :noun_rows, :content, :text
    add_column :noun_rows, :column_num, :integer
  end
end
