class ChangeColumnintweets < ActiveRecord::Migration
  def up
    rename_column :tweets,:tweet_time,:post_time
    rename_column :linkedins,:share,:content
  end

  def down
  end
end
