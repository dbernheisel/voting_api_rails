class Vote < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :voter

  validates :voter, uniqueness: true
end
