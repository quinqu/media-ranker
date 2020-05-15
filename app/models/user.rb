class User < ApplicationRecord
  has_and_belongs_to_many :votes

  def self.get_users(vote_id)
    vote = Vote.find_by(id: vote_id)
    return vote.users
  end



  def add_vote(vote)
    self.votes << vote 
  end 


  
end
