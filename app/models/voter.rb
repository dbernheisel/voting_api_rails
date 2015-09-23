class Voter < ActiveRecord::Base
  include Tokenable
  has_one :vote
  has_one :candidate, through: :vote

  def vote_for_candidate(c)
    return false if self.vote
    c.votes << Vote.create(voter_id: self.id)
  end
end
