require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  test "voter can only vote once" do
    v1 = Voter.create!(name: "Test", party: "Independent")
    c1 = Candidate.create!(name: "Trump", hometown: "Hell", district: "9th")
    c2 = Candidate.create!(name: "Trump2", hometown: "Hell", district: "9th")
    v1.vote_for_candidate(c1)
    assert_equal 1, c1.votes.length
    refute v1.vote_for_candidate(c2)
  end

  test "voter exists" do
    v1 = Voter.create!(name: "Test 2", party: "None")
    assert Voter.find(v1.id)
  end

end
