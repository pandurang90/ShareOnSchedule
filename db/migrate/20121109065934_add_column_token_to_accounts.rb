class AddColumnTokenToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :oauth_token, :string
    add_column :accounts, :oauth_token_secret, :string
    add_column :accounts, :oauth_verifier, :string
  end
end
