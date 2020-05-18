class TopMediaController < ApplicationController
  def index 
    @top_media = Work.find_top
    @albums =  Work.find_top_amount("album")
    @books = Work.find_top_amount("book")
    @movies = Work.find_top_amount("movie")
  end 

end
