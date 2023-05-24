# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@user = User.create(email: 'user@example.com', password: 'password', password_confirmation: 'password', first_name: 'Jon', last_name: 'Snow')

puts '1 user created'

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rational content", user_id: @user.id)
end

puts '100 posts have been created'
