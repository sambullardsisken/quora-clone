# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# u1 = User.create!(username: "sam", password: "password")
# u2 = User.create!(username: "jp", password: "password")
#
# q1 = u1.questions.build(title: "anybody home?")
# q2 = u2.questions.build(title: "hello?")
# q1.save!
# q2.save!
#
# a1 = q1.answers.build(text: "jp is here")
# a1.user_id = u2.id
# a2 = q2.answers.build(text: "hello jp")
# a2.user_id = u1.id
# a1.save
# a2.save
#
s1 = Subject.create!(name: "sports")
s2 = Subject.create!(name: "outdoor stuff")
s3 = Subject.create!(name: "learning")
s4 = Subject.create!(name: "arts")

t1 = s1.topics.create!(name: "ultimate")
t2 = s1.topics.create!(name: "baseball")
t3 = s1.topics.create!(name: "swimming")

t5 = s2.topics.create!(name: "climbing")
t6 = s2.topics.create!(name: "backpacking")
t7 = s3.topics.create!(name: "physics")
t8 = s3.topics.create!(name: "books")

t9 = s4.topics.create!(name: "music")
t10 = s4.topics.create!(name: "visual arts")






