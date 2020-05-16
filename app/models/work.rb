class Work < ApplicationRecord
  has_one :vote
  after_create :create_vote
  validates :title, presence: true
  validates :creator, presence: true
  validates :year, presence: true
  validates :description, presence: true



  def create_vote
    vote = Vote.create(work_id: self.id)
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
  
  protected 

  def self.category_options
    [["Album", "album"], ["Book", "book"], ["Movie", "movie"]]
  end 

end
