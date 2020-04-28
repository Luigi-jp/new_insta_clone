class ChangeUsernameToUsers < ActiveRecord::Migration[5.1]
  def up
    change_column_null :users, :username, false, ""
    change_column :users, :username, :string, default: ""
  end

  def down
    change_column_null :users, :username, true, nil
    change_column :users, :username, :string, default: nil
  end
end
