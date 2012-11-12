class AddColumnToTweets < ActiveRecord::Migration
  def up
    add_column :tweets, :is_tweeted, :boolean
  end

  def down
    remove_column :tweets, :is_tweeted 
  end
end