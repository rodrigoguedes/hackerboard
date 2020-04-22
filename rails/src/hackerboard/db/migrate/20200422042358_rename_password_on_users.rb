class RenamePasswordOnUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :password, :password_plain
  end
end
