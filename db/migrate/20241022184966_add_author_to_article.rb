class AddAuthorToArticle < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :author, foreign_key: { to_table: :accounts }
  end
end
