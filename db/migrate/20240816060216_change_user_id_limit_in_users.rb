class ChangeUserIdLimitInUsers < ActiveRecord::Migration[7.1]
  def up
    change_column :users, :userid, limit: 20
  end

  def down
    change_column :users, :userid
  end
end
