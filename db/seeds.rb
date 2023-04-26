# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Dylan Barr', email: 'dylbar@jane.com', password: 'LotionBottleOnTheTable333!!', role: 'patient')

User.create(name: 'Calvin McDonald', email: 'calvin@mcdonalds.com', password: 'LotionBottleOnTheTable333!!',
            role: 'patient')

User.create(name: 'Jason Tatum', email: 'jasont@gexample.com', password: 'LotionBottleOnTheTable333!!',
            role: 'staff_member')

User.create(name: 'Jason Chuck', email: 'jasonchuck@gexample.com', password: 'LotionBottleOnTheTable333!!',
            role: 'staff_member')

User.create(name: 'Trevor Johns', email: 'trevvvor@example.com', password: 'LotionBottleOnTheTable333!!', role: 'super')

User.create(name: 'Kasandra staff', email: 'Kasandra@example.com', password: 'LotionBottleOnTheTable333!!',
            role: 'staff_member')
User.create(name: 'Kasandra patient', email: 'Kasandrapatient@example.com', password: 'LotionBottleOnTheTable333!!',
            role: 'patient')
User.create(name: 'Kasandra super', email: 'Kasandrasuper@example.com', password: 'LotionBottleOnTheTable333!!',
            role: 'super')
