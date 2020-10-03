class AddNounIdToNounRow < ActiveRecord::Migration[6.0]
  def change
    add_column :noun_rows, :noun_id, :integer
  end
end
