class User < ApplicationRecord
  has_many :votes

  def self.get_vote_users(vote)
    users = []
    vote.users.each do |user_id|
      users << User.find_by(id: user_id)
    end 
    return users
  end
  
end
