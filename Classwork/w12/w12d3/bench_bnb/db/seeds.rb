# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

bench1 = Bench.create(description: 'de Young Museum bench', lat: 37.77242, lng: -122.47080)
bench2 = Bench.create(description: 'Golden Gate Park', lat: 37.76950, lng: -122.48363)
bench3 = Bench.create(description: 'Palace of Fine Arts', lat: 37.79979, lng: -122.45053)
bench4 = Bench.create(description: 'The Castro', lat: 37.75872, lng: -122.42725)
bench5 = Bench.create(description: 'Lake Merced Park', lat: 37.71690, lng: -122.51051)