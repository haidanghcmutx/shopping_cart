# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: 'Hai Dang', email: 'haidang.vobui@gmail.com', phone: '0886073802', address: 'KTX khu A',
    password: '12102001', password_confirmation: '12102001')
    99.times do |n|
        name = Faker::Name.name
        email = "example-#{n+1}@bookstore.com"
        address = Faker::Address.full_address
        password = "password"
        phone = Faker::Number.leading_zero_number(digits: 10)
        password = 'password'
        User.create!(name:, email:, address:, phone:, password:,
               password_confirmation: password)
end


users = User.order(:created_at).take(5)
10.times do
  name = Faker::Name.name
  phone = Faker::Number.leading_zero_number(digits: 10)
  address = Faker::Address.full_address
  description = Faker::Lorem.sentence(word_count: 20)
  users.each do |user|
    shop = user.shops.create!(name:, phone:, address:, description:)
    50.times do
      title = Faker::Book.title
      author = Faker::Book.author
      publisher = Faker::Book.publisher
      price = Faker::Number.between(from: 10_000, to: 10_000_000)
      amount = 10
      description1 = Faker::Lorem.sentence(word_count: 20)
      img_url = Faker::LoremFlickr.image
      shop.books.create!(title:, price:, amount:, author:, publisher:, descrition: description1)
    end
  end
end

10.times do
  name = Faker::Book.unique.genre
  description = Faker::Lorem.sentence(word_count: 20)
  img_url = Faker::LoremFlickr.image
  Category.create!(name:, description:)
end
        
