class CreateFbPosts < ActiveRecord::Migration
  def change
    create_table :fb_posts do |t|
      t.integer :user_id
      t.string :content
      t.datetime :post_time
      t.boolean :is_posted

      t.timestamps
    end
  end
end
