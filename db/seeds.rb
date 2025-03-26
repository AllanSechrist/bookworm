# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Deleting existing data..."
Book.destroy_all
Author.destroy_all
Publisher.destroy_all
Genre.destroy_all
User.destroy_all
puts "Seeding data base..."

number_of_authors = 10
number_of_publishers = 10
number_of_genres = 10
number_of_books = 3

# Authors, Publishers, and Genres
number_of_authors.times do |index|
  Author.create!(first_name: Faker::Name.unique.first_name, middle_name: Faker::Name.unique.middle_name, last_name: Faker::Name.unique.last_name)
end

number_of_publishers.times do |index|
  Publisher.create!(name: Faker::Company.unique.name)
end

number_of_genres.times do |index|
  Genre.create!(genre: Faker::Book.unique.genre)
end

# Books
isbn = 1234567890123

Author.all.each_with_index do |author, index|
  number_of_books.times do |book|
    Book.create!(
      title: Faker::Book.unique.title,
      isbn: isbn.to_s,
      author: author,
      genre: Genre.all[index],
      publisher: Publisher.all[index]
    )
    isbn += 1
  end
end

# Users
users = [
  {email: "allan@allan.com", first_name: "Allan", last_name: "Sechrist", username: "Amaat", password: "123456"},
  {email: "cindy@cindy.com", first_name: "Cindy", last_name: "Nhoho", username: "Iamngohomae", password: "123456"},
  {email: "ben@ben.com", first_name: "Ben", last_name: "Pearson", username: "BigBen", password: "123456"},
  {email: "sarah@sarah.com", first_name: "Sarah", last_name: "Chu", username: "Seorims", password: "123456"},
  {email: "Gary@Gary.com", first_name: "Gary", last_name: "Yau", username: "IamNotAFuckingCat", password: "123456"},
]

users.each do |user|
  User.create!(
    email: user[:email],
    first_name: user[:first_name],
    last_name: user[:last_name],
    username: user[:username],
    password: user[:password]
  )
end
puts "Finished seeding!"
