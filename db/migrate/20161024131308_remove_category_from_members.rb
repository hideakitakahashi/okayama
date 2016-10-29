class RemoveCategoryFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :category, :string
  end
end
