class AddTokenToVoter < ActiveRecord::Migration
  def change
    add_column :voters, :token, :string
  end
end
