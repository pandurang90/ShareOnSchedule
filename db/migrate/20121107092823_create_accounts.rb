class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :provider
      t.string :username
      t.string :uid
      t.timestamps
    end

    remove_column :users, :provider
    remove_column :users, :uid
    #remove_column :users, :token
  end
end
