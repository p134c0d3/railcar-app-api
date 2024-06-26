class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :password_digest
      t.string :user_type

      t.timestamps
    end
  end
end
