# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Year.destroy_all
School.destroy_all
User.destroy_all

a = Student.create(name: "Alex Boberino", school_year: 1, gpa: 2.3, sport: "Basketball" , doctor_note: true)
b = Student.create(name: "Alex Boberino", school_year: 2, gpa: 2.7, sport: "Basketball", doctor_note: false)
c = Student.create(name: "Alex Boberino", school_year: 3, gpa: 2.5, sport: "Track Basketball")
d = Student.create(name: "Alex Boberino", school_year: 4, gpa: 4.3, sport: "Track")
e = Student.create(name: "Alex 5", school_year: 3, gpa: 2.3, sport: "Football")
f = Student.create(name: "Alex 6", school_year: 2, gpa: 2.3, sport: "Cricket")
g = Student.create(name: "Chris 1", school_year: 1, gpa: 2.3,sport: "Basketball")

rig = User.create(school_name: "rig",password: "password")
pi = User.create(school_name: "pi" ,password: "password")

righetti = School.create!(name: "Righetti High School", user: rig )
pioneer = School.create!(name: "Pioneer Valley High School", user: pi)

year1 = Year.create!(number: 2017, students: [a,e], school: righetti)
year2 = Year.create!(number: 2018, students: [b,e], school: pioneer)










