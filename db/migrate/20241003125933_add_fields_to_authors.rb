class AddFieldsToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :first_name, :string, null: false
    add_column :authors, :last_name, :string, null: false
    add_column :authors, :status, :string
  end
end
