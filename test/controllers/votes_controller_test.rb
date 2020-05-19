require "test_helper"

describe VotesController do
 it "will add user to vote" do 
  work = Work.create(title: "delete me", category: "book", year: "2000", description: "DELETE", creator: "creator")
  vote = Vote.find_by(work_id: work.id)

  
  user_hash = {
    user: {
      username: "Vote User"
    }
  }

  post login_path, params: user_hash
  get upvote_path(vote.id)

  expect(vote.users[0].username).must_equal user_hash[:user][:username]

 end 
end
