class Vote < ApplicationRecord
  belongs_to :work
  has_and_belongs_to_many :users

  def self.get_votes_by_user(user)
    votes = []
    votes.users.each do |vote| 
      votes << Vote.find_by(user_id: user.id)
    end 
    return votes
  end 

end
