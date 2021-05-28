# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

images = [
"https://images.unsplash.com/photo-1599797574782-fd636bdb5cd2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1588260693059-2631306cc8b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1589088483612-7160434c9b85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8M3w5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1588687078517-9fff9c65ba48?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1584285405429-136bf988919c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1579783483375-677b76533ac0?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OHw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1578320339840-73f0a565894c?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Nnw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1579783483522-6ca1a85ec863?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8N3w5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1579168133409-34acb719c8b6?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXw5MjU5MTEyfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1582561424760-0321d75e81fa?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1582561768409-d9cdaca2c12d?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1583243535987-0cf3da658f43?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTN8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1584278773680-8d940a213dcf?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTR8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1584285375230-3446f9176740?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTV8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1579541592065-da8a15e49bc7?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTh8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1579541764764-6401d4100dd7?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTd8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1584285374947-6bfa952d3de2?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTZ8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1577720580479-7d839d829c73?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjB8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1577083164837-7082127bd3ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MjV8OTI1OTExMnx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
"https://images.unsplash.com/photo-1577083862802-be9c4123bfa2?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mjd8OTI1OTExMnx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
]

puts "Cleaning db..."
Art.delete_all

4.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "1234567",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save!
  puts "Created #{user.first_name} #{user.last_name}..."

  5.times do
    image = images.sample
    art = Art.new(
    artist: Faker::Artist.name,
    description: Faker::Hipster.paragraph(sentence_count: 2),
    title: Faker::Books::CultureSeries.book,
    price: rand(1000..5000)/100.00,
    picture: image,
    user_id: user.id
    )

    images.delete(image)

    art.save!
    puts "Art: #{art.title} created..."
  end
end

puts "Finished!"
