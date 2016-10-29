class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :url
      t.string :email
      t.string :phone
      t.references :member, foreign_key: true

      t.timestamps
    end
     add_index :shops, [:member_id, :created_at]
  end
end
