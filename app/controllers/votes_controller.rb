class VotesController < ApplicationController


  def index 
    if params[:work_id]
      work = Work.find_by(id: params[:work_id])
      vote = work.vote
      user_votes = User.get_users(vote)
      @votes = user_votes
    elsif params[:user_id] 
      user = User.find_by(id: params[:user_id]) 
      votes = Vote.get_votes_by_user(user)
      @votes = votes
    end
  end 

  def upvote 
    
    @vote = Vote.find_by(id: params[:format])
    user  = User.find_by(id: session[:user_id])
    if User.not_voted(@vote.id, user.id)
      @vote.users << user
      redirect_to works_path
    else
      flash[:error] = "You cannot vote for the same work more than once"
      redirect_to works_path
    end 
  end 

  






end
