require "test_helper"

describe User do
  let (:work) {
    Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
  }

  it "will get all users for a vote" do 
    #Arrange
    vote = Vote.find_by(work_id: work.id)
    vote.users << users(:user1)
    #Act
    users = User.get_users(vote.id)
    #Assert
    expect(users[0].username).must_equal "user1"
  end  
  
  it "will verify that a user can vote if they haven't voted yet" do 
    #Arrange 
    vote = Vote.find_by(work_id: work.id)
    user = users(:user2)
    #Act & Assert
    expect(User.not_voted(vote.id, user.id)).must_equal true 
  end 

  it "will not let user vote if they have voted" do 
    #Arrange
    vote = Vote.find_by(work_id: work.id)
    vote.users << users(:user1)
    user = users(:user3)
    vote.users << user

    #Act & Assert
    expect(User.not_voted(vote.id,user.id)).must_equal false 
  end 

  describe "validations" do 

    it "will not create user with missing required input" do 
      #Arrange
      user = User.create(username: "")
      #Act & Assert
      expect(user.errors.nil?).must_equal false
    end 

    it "will validate unique usernames" do 
      #Arrange 
      user = users(:user1).save
      #Act
      user = User.create(username: "user1")
      error = ""
      user.errors.each do |column, message|
        error = column 
      end 
      #Assert
      expect(error.to_s).must_equal "username"
    end 
  end 
end
