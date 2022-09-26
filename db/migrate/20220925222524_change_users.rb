class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password
    remove_column :users, :password_confirm
  end
end
