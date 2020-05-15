class RemoveVoteIdFromWorks < ActiveRecord::Migration[6.0]
  def change
    remove_reference :works, :vote, index: true
  end
end
