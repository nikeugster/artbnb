# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning db..."
Art.destroy_all

5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "1234567",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  puts "Created #{user.first_name} #{user.last_name}..."

  5.times do
    art = Art.new(
    artist: Faker::Artist.name,
    description: Faker::Hipster.paragraph(sentence_count: 2),
    title: Faker::Books::CultureSeries.book,
    price: rand(1000..5000)/100.00,
    picture: Faker::LoremFlickr.image(size: "120x120", search_terms: ['art', 'painting'], match_all: true),
    user_id: user.id
    )

    art.save!
    puts "Art: #{art.title} created..."
  end
end

puts "Finished!"
