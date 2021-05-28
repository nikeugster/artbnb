# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Cleaning db..."

Art.delete_all
User.delete_all
Booking.delete_all



juergen = User.new(
  email: "jürgen@dose.de",
  password: "123456",
  first_name: "Jürgen",
  last_name: "Dose"
)

juergen.save!
puts "Created #{juergen.first_name} #{juergen.last_name}..."

puts "Creating #{juergen.first_name}s art..."

scream = URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg/800px-Edvard_Munch%2C_1893%2C_The_Scream%2C_oil%2C_tempera_and_pastel_on_cardboard%2C_91_x_73_cm%2C_National_Gallery_of_Norway.jpg')

scream_art = Art.new(
  artist: "Edvard Munch",
  description: "The Scream is the popular name given to a composition created by Norwegian Expressionist artist Edvard Munch in 1893. The original German title given by Munch to his work was Der Schrei der Natur (The Scream of Nature), and the Norwegian title is Skrik (Shriek). The agonised face in the painting has become one of the most iconic images of art, seen as symbolising the anxiety of the human condition.

Munch recalled that he had been out for a walk at sunset when suddenly the setting sun's light turned the clouds 'a blood red'. He sensed an 'infinite scream passing through nature'. Scholars have located the spot to a fjord overlooking Oslo, and have suggested other explanations for the unnaturally orange sky, ranging from the effects of a volcanic eruption to a psychological reaction by Munch to his sister’s commitment at a nearby lunatic asylum.

Munch created two versions in paint and two in pastels, as well as a lithograph stone from which several prints survive. Both of the painted versions have been stolen, but since recovered. One of the pastel versions commanded the fourth highest nominal price paid for an artwork at a public auction.",
  title: "The Scream",
  price: 14.99,
  user_id: juergen.id
)
scream_art.photo.attach(io: scream, filename: 'scream.jpg', content_type: 'image/jpg')
scream_art.save!

puts "Created #{scream_art.title}"

puts "Finished!"
