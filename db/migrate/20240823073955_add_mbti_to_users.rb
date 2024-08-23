class AddMbtiToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :mbti, :string
  end
end
