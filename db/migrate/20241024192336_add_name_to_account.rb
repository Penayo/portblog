class AddNameToAccount < ActiveRecord::Migration[7.2]
  def change
    add_column :accounts, :name, :string
    remove_column :accounts, :first_name
    remove_column :accounts, :last_name
  end
end
