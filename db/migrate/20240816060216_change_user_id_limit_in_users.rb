class ChangeUserIdLimitInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :userid, limit: 20
  end
end
