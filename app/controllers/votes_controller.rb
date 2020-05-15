class VotesController < ApplicationController


  def index 
    if params[:work_id]
      work = Work.find_by(id: params[:work_id])
      user_votes = User.get_vote_users(work.vote)
      @votes = user_votes
    elsif params[:user_id] 
      user = User.find_by(id: params[:user_id])
      votes = Vote.get_votes_by_user(user)
       @votes = votes
    end
  end 

  def update 
    #add user to vote.users

  end 

  






end
