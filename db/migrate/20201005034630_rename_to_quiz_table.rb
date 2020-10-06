class RenameToQuizTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :prequizzes, :quizzes
    add_column :quizzes, :kind, :string
  end
end
