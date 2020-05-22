class User < ApplicationRecord
  has_and_belongs_to_many :votes
  validates :username, presence: true, uniqueness: true
  
  def self.get_users(vote_id)
    users = []
    vote = Vote.find_by(id: vote_id)
    vote.users.each do |user|
      users << User.find_by(id: user.id)
    end 
    return users
  end

  def self.not_voted(vote_id, user_id)
    user = User.find_by(id: user_id)
    user_votes = user.votes
    user_votes.each do |vote|
      if vote.id == vote_id
        return false
      end 
    end 
    return true 
  end 
end
