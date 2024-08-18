class AddColumnToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :username, :string
    add_column :users, :profile_id, :string, limit: 20
  end
end
