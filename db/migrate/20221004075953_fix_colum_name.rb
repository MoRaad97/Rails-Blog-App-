class FixColumName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :users_id, :user_id
    rename_column :comments, :posts_id, :post_id
    rename_column :likes, :users_id, :user_id
    rename_column :likes, :posts_id, :post_id
    rename_column :posts, :users_id, :user_id
  end
end
