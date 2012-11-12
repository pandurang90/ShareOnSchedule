class AddColumnSharedToLinkedins < ActiveRecord::Migration
  def up
    add_column :linkedins, :is_shared, :boolean
  end

  def down
  	remove_column :linkedins, :is_shared
  end
end