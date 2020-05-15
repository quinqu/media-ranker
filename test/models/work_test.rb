require "test_helper"

describe Work do

  let (:new_work) {
    Work.new(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
  }
  it "can be instantiated" do
    # Assert
    expect(new_work.valid?).must_equal true
  end

  it "will have the required fields" do
    new_work.save

    work = Work.first
    [:title, :category, :year, :description, :creator].each do |field|

      # Assert
      expect(work).must_respond_to field
    end
  end

  describe "relations" do 
    it "has a creator" do 
      movie = works(:movie)
      expect(movie.creator).must_equal "Jordan Peele"
    end 
    it "can change the creator" do 
      album = works(:album)
      album.update_attribute(:creator, "Alex G")
      expect(album.creator).must_equal "Alex G"
    end 

    it "will not update if there is a blank input" do 
      work = Work.new()
      saved = work.save
      expect(saved).must_equal false
    end 
  end 

  describe "work model methods" do 
    it "will get top albums, books, movies" do 
      albums = Work.find_top_albums
      expect(albums).must_be_instance_of Array
      #expect(albums.length).must_equal 10 

      books = Work.find_top_books
      expect(books).must_be_instance_of Array

      movies = Work.find_top_albums
      expect(movies).must_be_instance_of Array
    end 

    it "will find the top media " do 


    end 

    it "will return catergory options for view" do 
      options = Work.category_options
      expect(options).must_be_instance_of Array

    end 



  end 








end
