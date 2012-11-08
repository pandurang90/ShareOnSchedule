class CreateLinkedins < ActiveRecord::Migration
  def change
    create_table :linkedins do |t|
			t.integer :user_id
      t.string :share
      t.datetime :post_time
      t.timestamps
    end
  end
end
