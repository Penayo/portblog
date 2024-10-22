class CreateAccounts < ActiveRecord::Migration[7.2]
  def change
    create_table :accounts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :status, default: "inactive"
      t.string :headline
      t.string :password_digest
      t.boolean :email_confirmed

      t.timestamps
    end
  end
end
