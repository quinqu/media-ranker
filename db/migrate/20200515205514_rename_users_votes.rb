class RenameUsersVotes < ActiveRecord::Migration[6.0]
  def change
    rename_table :users_votes_joins, :users_votes
  end
end
