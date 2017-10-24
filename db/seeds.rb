# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
d1 = DateTime.new(2013, 6, 22)
d2 = DateTime.new(2015, 8, 10)
d3 = DateTime.new(2014, 9, 13)
cat1 = Cat.create!(name: 'Teddy', birth_date: d1, color: 'black', sex: 'M', description: 'A fluffy little cat')
cat2 = Cat.create!(name: 'Cyndi', birth_date: d2, color: 'brown', sex: 'F', description: 'A small cute cat')
cat3 = Cat.create!(name: 'Pishi', birth_date: d3, color: 'white', sex: 'M', description: 'A grumpy cat')
