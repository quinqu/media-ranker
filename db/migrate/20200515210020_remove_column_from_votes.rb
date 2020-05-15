class RemoveColumnFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :count, :integer
  end
end
