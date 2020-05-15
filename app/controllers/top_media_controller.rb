class TopMediaController < ApplicationController
  def index 
    @top_media = Work.find_top_media
    @albums = Work.find_top_albums
    @books = Work.find_top_books
    @movies = Work.find_top_movies
  end 





end
