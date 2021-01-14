class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :comments, :string
    add_column :users, :image, :string
    add_column :users, :view, :string
  end
end
