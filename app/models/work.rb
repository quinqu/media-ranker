class Work < ApplicationRecord
  belongs_to :vote, optional: true
  after_create :test

  def create_vote
    return Vote.create 
  end 
end
