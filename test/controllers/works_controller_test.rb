require "test_helper"

describe WorksController do
  let (:new_work) {
    Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
  }


  describe "show" do 
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
      
      must_redirect_to works_path
    end 
  end 

  describe "edit " do 

    it "will edit" do 
      edit_work = {
        work: { 
          title: "Night and Blur", 
          category: "album", 
          year: "2020", 
          description: "awesome album", 
          creator: "The Bilinda Butchers"
        }
      }

      post works_path, params: edit_work
      work = Work.find_by(title: edit_work[:work][:title])

      get edit_work_path(work.id)
      must_respond_with :ok
    end 

    it "will respond with redirect if nonexistent work" do
      get edit_work_path(-100)
      must_respond_with :not_found
    end
  end 

  describe "update" do 
    it "will update el work " do 

    update_work = {
      work: { 
        title: "Night and Blur", 
        category: "album", 
        year: "2020", 
        description: "awesome album", 
        creator: "The Bilinda Butchers"
      }
    }

    work = Work.first
    patch work_path(work.id), params: update_work
  
    expect(Work.first.title).must_equal update_work[:work][:title]
    expect(Work.first.year).must_equal update_work[:work][:year]
    end 

  end 


  describe "delete" do 
    it "will delete work" do
      Work.create(title: "delete me", category: "book", year: "2000", description: "DELETE", creator: "creator")
      work = Work.first
      expect{delete work_path(Work.first.id)}.must_differ "Work.count", -1
    end

  end 



end
