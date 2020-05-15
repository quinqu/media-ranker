class User < ApplicationRecord
  has_and_belongs_to_many :votes

  def self.get_user_votes(vote)
    votes = []
    users.votes.each do |vote|
      votes << Vote.find_by(id: vote.vote_id)
    end 
    return votes
  end

  


  
end
