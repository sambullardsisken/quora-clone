class CreatePostTaggings < ActiveRecord::Migration
  def change
    create_table :post_taggings do |t|
      t.integer :post_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
