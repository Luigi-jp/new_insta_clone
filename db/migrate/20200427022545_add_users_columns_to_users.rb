class AddUsersColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :fullname, :string, null: false, default: ""
    add_column :users, :image, :string
    add_column :users, :website, :string
    add_column :users, :introduction, :string
    add_column :users, :phone, :string
    add_column :users, :sex, :string
  end
end
