class CreateVotesUsersJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :votes_users_joins do |t|
      t.belongs_to :vote, index: true
      t.belongs_to :user, index: true
    end
  end
end
