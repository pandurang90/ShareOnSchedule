class AddColumnTokenToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :oauth_token, :string
  end
end
