require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "vote exists" do
    voter1 = Voter.create!(name: "Test", party: "Independent")
    v = Vote.create!(voter: voter1)
    assert Vote.find(v.id)
  end
end


