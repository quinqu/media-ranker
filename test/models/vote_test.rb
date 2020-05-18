require "test_helper"

describe Vote do
  it "will get all votes by user" do 
    work1 = Work.create(title: "Title", category: "movie", year: "2000", description: "hi", creator: "creator")
    vote1 = Vote.find_by(work_id: work1.id)
    work2 = Work.create(title: "random", category: "book", year: "2020", description: "idk", creator: "person")
    vote2 = Vote.find_by(work_id: work2.id)

    user = User.create(username: "vote model test user")

    user.votes << vote1
    user.votes << vote2

    votes = Vote.get_votes_by_user(user)

    expect(votes.length).must_equal 2

    expect(votes[0].work.title).must_equal "Title"
    expect(votes[1].work.title).must_equal "random"
  end 
end
