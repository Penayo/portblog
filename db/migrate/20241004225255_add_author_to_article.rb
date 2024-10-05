class AddAuthorToArticle < ActiveRecord::Migration[7.2]
  def change
    add_reference :articles, :author, null: false, default: 3, foreign_key: true
  end
end
