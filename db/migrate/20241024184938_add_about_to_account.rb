class AddAboutToAccount < ActiveRecord::Migration[7.2]
  def change
    add_column :accounts, :about, :string
  end
end
