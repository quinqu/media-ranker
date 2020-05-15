class User < ApplicationRecord
  has_and_belongs_to_many :votes

  def self.get_users(vote)
    votes = []
    users.votes.each do |vote|
      votes << Vote.find_by(id: vote.vote_id)
    end 
    return votes
  end



  def add_vote(vote)
    self.votes << vote 
  end 


  
end
