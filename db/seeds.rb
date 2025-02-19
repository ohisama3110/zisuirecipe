# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'ohisama7039@yahoo.co.jp', password: 'sy3319sy')

puts "seedの実行を開始"


users = [
  { name: 'Alice', email: 'alice@example.com', password: 'password' },
  { name: 'Bob', email: 'bob@example.com', password: 'password' },
]

users.each do |user_data|
  user = User.create(user_data)
end

recipes = [
  { dish_name: 'オムライス', ingredient: '卵、ご飯、ケチャップ', servings: 2},
  { dish_name: 'カレーライス', ingredient: 'カレールー、ご飯、具材', servings: 4},
]

recipes.each do |recipe_data|
  user = User.find_by(name: 'Alice')
  recipe_data[:user_id] = user.id
  Recipe.create(recipe_data)
end