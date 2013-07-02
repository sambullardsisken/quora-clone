# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create!(username: "sam", password: "password")
u2 = User.create!(username: "jp", password: "password")

q1 = u1.questions.build(title: "anybody home?")
q2 = u2.questions.build(title: "hello?")
q1.save!
q2.save!

a1 = q1.answers.build(text: "jp is here")
a1.user_id = u2.id
a2 = q2.answers.build(text: "hello jp")
a2.user_id = u1.id
a1.save
a2.save

