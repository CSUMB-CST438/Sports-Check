# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all

Student.create(name: "Alex 0", school_year: 1, gpa: 2.3, sport: "Wrestling" , doctor_note: true)
Student.create(name: "Alex 1", school_year: 2, gpa: 2.3, sport: "Basketball", doctor_note: false)
Student.create(name: "Alex 2", school_year: 3, gpa: 2.3, sport: "Track Basketball")
Student.create(name: "Chris", school_year: 4, gpa: 2.3, sport: "Track")

Student.create(name: "Alex 5", school_year: 3, gpa: 2.3, sport: "Football")
Student.create(name: "Alex 6", school_year: 2, gpa: 2.3, sport: "Cricket")
Student.create(name: "Chris 1", school_year: 1, gpa: 2.3,sport: "Basketball")