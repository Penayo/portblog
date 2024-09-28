class CreateAuthors < ActiveRecord::Migration[7.2]
  def change
    create_table :authors do |t|
      t.string :full_name
      t.string :email
      t.string :profile_img

      t.timestamps
    end
  end
end
