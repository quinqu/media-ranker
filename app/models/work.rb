class Work < ApplicationRecord
  belongs_to :vote, optional: true
  after_create :create_vote

  def create_vote
    vote = Vote.create(work_id: self.id, count: 0)
    self.update_attribute(:vote_id, vote.id)
  end 

end
