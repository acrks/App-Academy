# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat_1 = Cat.create(name: 'Garfield', color: 'Ginger', sex: 'M', description: 'He likes lasagna and hate Mondays', birth_date: DateTime.new(1978, 6, 19))
cat_2 = Cat.create(name: 'Salem', color: 'Black', sex: 'M', description: 'Also likes lasagna and hate Mondays, but is a big fan of Tuesdays', birth_date: DateTime.new(2010, 10, 31))
cat_3 = Cat.create(name: 'Garfield 2', color: 'Orange', sex: 'M', description: 'He likes lasagna and hate Mondays', birth_date: DateTime.new(1978, 6, 19))

