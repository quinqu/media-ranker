class Vote < ApplicationRecord
  belongs_to :work
  has_and_belongs_to_many :users

  def self.get_votes_by_user(user)
    votes = []
    user.votes.each do |vote| 
      votes << Vote.find_by(id: vote.id)
    end 
    return votes
  end 

  

end
