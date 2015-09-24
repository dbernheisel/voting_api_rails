# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Candidate.create(name: "Gonna", party: "Democrat", hometown: Faker::Address.city, district: "Ninth")
c2 = Candidate.create(name: "Never", party: "Republican", hometown: Faker::Address.city, district: "Ninth")
c3 = Candidate.create(name: "Give", party: "Independent", hometown: Faker::Address.city, district: "Ninth")
c4 = Candidate.create(name: "You", party: "Green", hometown: Faker::Address.city, district: "Ninth")
c5 = Candidate.create(name: "Up", party: "Labour", hometown: Faker::Address.city, district: "Ninth")
v1 = Voter.create(name: "Never", party: "None")
v2 = Voter.create(name: "Gonna", party: "Independent")
v3 = Voter.create(name: "Let", party: "Independent")
v4 = Voter.create(name: "You", party: "Independent")
v5 = Voter.create(name: "Down", party: "Independent")
Vote.create(voter_id: v1.id, candidate_id: c1.id)
Vote.create(voter_id: v2.id, candidate_id: c2.id)
Vote.create(voter_id: v3.id, candidate_id: c3.id)
