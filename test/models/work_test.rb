require "test_helper"

describe Work do
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








end
