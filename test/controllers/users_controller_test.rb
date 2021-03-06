require "test_helper"

describe UsersController do
  let (:user_hash) {
    { user: {
        username: "Grace Hopper"
      }
    }
  } 

  it "must get login_form" do
    get login_path
    must_respond_with :success
  end

  describe "logging in" do 
    it "can log in a new user" do 
     expect{
      post login_path, params: user_hash
     }.must_differ "User.count", 1

      must_respond_with :redirect
      
      user = User.find_by(username: user_hash[:user][:username])

      expect(user).wont_be_nil
      expect(session[:user_id]).must_equal user.id
      expect(user.username).must_equal user_hash[:user][:username]
    end 

    it "can log in an exising user" do 
      post login_path, params: user_hash

      expect {
        post login_path, params: user_hash
      }.wont_change "User.count"

      user = User.find_by(username: user_hash[:user][:username])
      expect(session[:user_id]).must_equal user.id
    end 
  end

  describe "logout" do 
    it "can logout user" do 
      post login_path, params: user_hash
      post logout_path

      expect(session[:user_id]).must_be_nil

    end
  end 

  describe " current " do 
    it "will direct to current user" do 
      user = User.create(username: "Grace Hopper")
      post login_path, params: user_hash

      expect(session[:user_id]).must_equal user.id
      get current_user_path
      must_respond_with :redirect
    end 

  end 
  
end
