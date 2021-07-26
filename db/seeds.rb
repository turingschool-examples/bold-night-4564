# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mechanic.destroy_all

@mechanic_1 = Mechanic.create!(
  name: 'Michael',
  years_of_experience: 8
)
@mechanic_2 = Mechanic.create!(
  name: 'Dwight',
  years_of_experience: 7
)
@mechanic_3 = Mechanic.create!(
  name: 'Jim',
  years_of_experience: 4
)
@mechanic_4 = Mechanic.create!(
  name: 'Pam',
  years_of_experience: 10
)
