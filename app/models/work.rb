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

  def self.find_top_amount(type)
    works = Work.where(category: type)
    works = works.sort_by { |work| work.vote.users.length }
    works = works.reject { |work| work.vote.users.length == 0 }
    return works.last(10).reverse
  end 

  def self.find_top
    works = Work.all
    works = works.sort_by { |work| work.vote.users.length }
    return works[works.length - 1]
  end
  
  def self.sort_media(type)
    valid_types = ["book", "album", "movie"]
    if !valid_types.include?(type)
      raise ArgumentError, "Invalid type"
    end 
    
    works = Work.where(category: type)
    works = works.sort_by { |work| work.vote.users.length }
    return works.reverse
  end 

  protected 

  def self.category_options
    [["Album", "album"], ["Book", "book"], ["Movie", "movie"]]
  end 

end
