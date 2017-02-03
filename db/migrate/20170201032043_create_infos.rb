class CreateInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :infos do |t|
        t.string :howto, null: false
        t.string :why, null: false
        t.string :vision, null: false

      t.timestamps
    end
  end
end
