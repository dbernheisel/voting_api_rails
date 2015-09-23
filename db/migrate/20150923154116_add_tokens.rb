class AddTokens < ActiveRecord::Migration
  def change
    add_column :voters, :auth_token, :string
  end
end
