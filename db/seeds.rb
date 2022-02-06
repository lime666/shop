# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

categories = 10.times.map do
  Category.create({
                    title: Faker::Beer.brand
                  })
end

@products = 1000.times.map do
  category = categories.sample
  Product.create(
    {
      title: Faker::Beer.name,
      price: Faker::Commerce.price(range: 1..999.0),
      category: category,
      description: Faker::ChuckNorris.fact
    }
  )
end
