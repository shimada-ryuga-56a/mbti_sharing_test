class ChangeUserIdLimitInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :user_id, :string, limit: 20
  end
end
