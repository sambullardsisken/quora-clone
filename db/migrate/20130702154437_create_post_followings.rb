class CreatePostFollowings < ActiveRecord::Migration
  def change
    create_table :post_followings do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
