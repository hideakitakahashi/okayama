class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :admin_name, null: false
      t.string :hashed_password

      t.timestamps
    end
  end
end
