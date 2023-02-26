# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "RUNNING SEEDS..."
user_count = User.count

def websites
%w( facebook.com mquinn.online twitter.com yahoo.com google.com substack.com youtube.com)
end

def seed_db!
user = User.create!(email: Faker::Internet.email, password: 'password')
user.projects.create!(title: Faker::Company.bs, description: Faker::Quotes::Shakespeare.hamlet_quote, website: websites.sample)
end

5.times do
  seed_db!
end


new_user_count = User.count - user_count
puts "CREATED #{new_user_count} users."
