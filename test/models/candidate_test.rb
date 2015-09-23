require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  test "candidate exists" do
    c = Candidate.create!(name: "TestC", hometown: "hell", district: "9th")
    assert Candidate.find(c.id)
  end
end
