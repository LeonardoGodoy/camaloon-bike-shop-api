# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.create(name: 'Camaloon Customer', email: 'camaloon_customer@gmail.com')

data = {
  name: 'Speed Bicycle',
  properties: [
    { title: 'wheel size', values: ['15', '17', '19'] },
    { title: 'rim color', values: ['blue', 'black', 'spotted'] },
    { title: 'saddle color', values: ['black', 'blue', 'brown'] }
  ]
}
create_category = CreateCategory.new(data)
create_category.perform

data = {
  category_id: create_category.category.id,
  title: 'Speed Bicycle PRO 2.0',
  description: 'Awesome product',
  properties: [
    { title: 'wheel size', values: ['15', '17', '19'] },
    { title: 'rim color', values: ['blue', 'black', 'spotted'] },
    { title: 'saddle color', values: ['black', 'blue', 'brown'] }
  ]
}
CreateProduct.new(data).perform

data = {
  category_id: create_category.category.id,
  title: 'Speed Bicycle PRO 2.5',
  description: 'Awesome product',
  properties: [
    { title: 'wheel size', values: ['19', '21'] },
    { title: 'rim color', values: ['blue', 'black', 'orange'] }
  ]
}
CreateProduct.new(data).perform
