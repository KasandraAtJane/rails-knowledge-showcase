# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Dylan Barr", email: "dylbar@jane.com", role: "patient")

User.create(name: "Calvin McDonald", email: "calvin@mcdonalds.com", role: "patient")

User.create(name: "Jason Tatum", email: "jasont@gexample.com", role: "staff_member")

User.create(name: "Jason Chuck", email: "jasonchuck@gexample.com", role: "staff_member")

User.create(name: "Trevor Johns", email: "trevvvor@example.com", role: "super")