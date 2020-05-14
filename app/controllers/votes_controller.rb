class VotesController < ApplicationController


  def index 
    #TODO add if statemnet if we need show for user votes 
    #Same with Works 
    #works is going to need to see all the users that voted for the work 
    # users show page will show all the works they voted for 
    #https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/nested-routes.md

    @votes = Votes.all  
  end 






end
