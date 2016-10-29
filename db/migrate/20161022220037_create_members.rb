class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :email, null: false
      t.string :email_for_index, null: false
      t.string :family_name, null: false
      t.string :family_name_kana, null: false
      t.string :given_name, null: false
      t.string :given_name_kana, null: false
      t.string :hashed_password

      t.timestamps
    end
  end
end
