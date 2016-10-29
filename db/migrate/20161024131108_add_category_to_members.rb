class AddCategoryToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :category, :string
  end
end
