require "test_helper"

describe WorksController do
  let (:new_work) {
    Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
  }

  describe "index" do 
    it "can get index page" do 
      get works_path 

      must_respond_with :success 

    end 

  end 

  describe "show" do 
    it "can show a valid work" do 
      get work_path(new_work.id)

      must_respond_with :success 
    end 

    it "will redirect for a non-existent work" do 
      get work_path(-6)
      must_respond_with :redirect
    end 
  end 


  describe "new" do 
    it "can get the new work page" do 
      get new_work_path 

      must_respond_with :success

    end 
  end 


  describe "create" do 
    it "can create a new work" do 
        new_work = {
          work: { 
            title: "Yeet", 
            category: "movie", 
            year: "2000", 
            description: "Twitter hahahahaha", 
            creator: "Skrrt Skrrt"
          }
        }

        expect {
          post works_path, params: new_work
        }.must_differ "Work.count", 1

      #Arrage
      work = Work.find_by(title: new_work[:work][:title])
      #Act and Assert
      expect(work.category).must_equal new_work[:work][:category]
      
      must_redirect_to work_path(work.id)
    end 
  end 


  describe "delete" do 

  end 



end
