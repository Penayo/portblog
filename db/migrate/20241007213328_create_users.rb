class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :email
      t.boolean :email_confirmed
      t.string :status, default: "inactive"

      t.timestamps
    end
  end
end
