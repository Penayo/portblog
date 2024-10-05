class AddHeadlineToAuthor < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :headline, :string
  end
end
