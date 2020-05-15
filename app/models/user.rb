class User < ApplicationRecord
  has_and_belongs_to_many :votes, optional: true
  after_create :add_join_date

  def self.get_vote_users(vote)
    users = []
    vote.users.each do |user_id|
      users << User.find_by(id: user_id)
    end 
    return users
  end
  
  def add_join_date 
    date = Time.now
    self.update_attribute(:join_date, date.strftime("%B %d, %Y").to_s)
  end 


end
