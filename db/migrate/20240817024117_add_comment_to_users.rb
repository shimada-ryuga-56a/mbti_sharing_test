class AddCommentToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :comment, :text
  end
end
