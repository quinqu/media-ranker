class User < ApplicationRecord
  has_and_belongs_to_many :votes

  def self.get_vote_users(vote)
    users = []
    vote.user_id.each do |user_id|
      users << User.find_by(id: user_id)
    end 
    return users
  end
  
  


end
