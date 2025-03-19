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
  { 
    dish_name: 'テスト料理1',
    introduction: 'この料理はテスト用に作成された料理です。',
    servings: 2,
    image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')),
    ingredients_attributes: [
      { ingredient: '材料1', quantity: '適量' },
      { ingredient: '材料2', quantity: '少々' }
    ],
    steps_attributes: [
      { process: '手順1', step_image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')) },
      { process: '手順2', step_image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')) }
    ]
  },
  { 
    dish_name: 'テスト料理2',
    introduction: 'この料理もテスト用に作成されました。',
    servings: 4,
    image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')),
    ingredients_attributes: [
      { ingredient: '材料3', quantity: '大さじ1杯' },
      { ingredient: '材料4', quantity: 'カップ1杯' }
    ],
    steps_attributes: [
      { process: '手順3', step_image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')) },
      { process: '手順4', step_image: File.open(Rails.root.join('db', 'fixtures', '25480370.jpg')) }
    ]
  }
]

user = User.find_by(name: 'Alice')

recipes.each do |recipe_data|
  recipe_data[:user_id] = user.id
  recipe = Recipe.new(recipe_data)
  recipe.save
end