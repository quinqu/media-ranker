class VotesController < ApplicationController

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
