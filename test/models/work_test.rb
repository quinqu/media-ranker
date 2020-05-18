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

    it "will find the top media " do 
      movie = Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
      vote = Vote.find_by(work_id: movie.id)
      answ = vote.nil?
      expect(answ).must_equal false
    end 

    it "will return catergory options for view" do 
      options = Work.category_options
      expect(options).must_be_instance_of Array
    end 

    it "will create a vote for every work instance" do 
      movie = Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
      vote = Vote.find_by(work_id: movie.id)
      expect(vote.work_id).must_equal movie.id
    end 

  end 

end
