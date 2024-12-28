class AddResponseToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :response, foreign_key: { to_table: :comments }
  end
end
