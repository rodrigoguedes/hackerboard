class RemovePasswordPlainFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :password_plain
  end
end
