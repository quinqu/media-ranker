class Work < ApplicationRecord
  belongs_to :vote, optional: true
  after_create :create_vote

  def create_vote
    vote = Vote.create(work_id: self.id, count: 0)
    self.update_attribute(:vote_id, vote.id)
  end 

  def self.get_voted_works(votes) 
    works = []
    votes.each do |vote| 
      works << Work.find_by(id: vote.work_id)
    end 
    return works
  end 

  def self.find_top_albums
    #need to find where category ==  albums and top 10
    albums = Work.where(:category => "album")
    return albums.sample(10)
  end 

  def self.find_top_books
    books = Work.where(:category => "book")
    return books.sample(10)
  end 

  def self.find_top_movies
    movies = Work.where(:category => "movie")
    return movies.sample(10)
  end 

  def self.find_top_media
    return Work.first
  end

end
