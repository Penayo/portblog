class AddCategoryToArticle < ActiveRecord::Migration[7.2]
  def change
    add_column :articles, :category, :string, null: false, default: "Programming"
  end
end
