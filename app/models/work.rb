class Work < ApplicationRecord
  belongs_to :vote, optional: true
  after_create :create_vote

  def create_vote
    vote = Vote.create(work_id: self.id, count: 0)
    self.update_attribute(:vote_id, vote.id)
  end 

  def self.get_voted_works(votes) 
    works = []
    votes.each do |vote| 
      works << Work.find_by(id: vote.work_id)
    end 
    return works
  end 
end
