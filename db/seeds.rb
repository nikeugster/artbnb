# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "Cleaning db..."

Booking.delete_all
Art.delete_all
User.delete_all

juergen = User.new(
  email: "jürgen@dose.de",
  password: "123456",
  first_name: "Jürgen",
  last_name: "Dose"
)

juergen.save!
puts "Created User: #{juergen.first_name} #{juergen.last_name}..."

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

mirror_hall = URI.open('https://upload.wikimedia.org/wikipedia/commons/4/4f/Mirror_Hall.jpg')
mirror_hall_art = Art.new(
  artist: "Kamal-ol-Molk",
  description: "Mirror Hall is an oil on canvas painting by Iranian realist painter Kamal-ol-Molk, his first work since receiving the title Kamal-ol-Molk ('Perfection of the Realm'). It is considered one of his masterpieces, and marks a starting point in Iran's modern art.

The painting was executed in over five years, depicting Qajar ruler Naser-ed-Din Shah sitting on a chair in front of a window at the Mirror Hall of the Golestan Palace, where the Qajar dynasty resided.

The completion of the painting coincided with the Qajar ruler's murder in 1896, and the rise of Mozaffar-ed-Din Shah, the fifth Qajar ruler.

Kamal-ol-Molk was later questioned about the theft of some precious gems located at the hall, but the actual culprit was eventually found.

The Mirror Hall is famous for its remarkable mirror work. It was designed by architect Abd-ol-Hosein (Sani-ol-Molk), while Minister of Architecture Yahya Khan (Mowtamed-ol-Molk) was the consultant.",
  title: "Mirror Hall",
  price: 10.99,
  user_id: juergen.id
)
mirror_hall_art.photo.attach(io: mirror_hall, filename: 'mirror_hall.jpg', content_type: 'image/jpg')
mirror_hall_art.save!

puts "Created #{mirror_hall_art.title}"

football_players = URI.open('https://upload.wikimedia.org/wikipedia/en/thumb/3/32/Albert_Gleizes%2C_1912-13%2C_Les_Joueurs_de_football_%28Football_Players%29%2C_oil_on_canvas%2C_225.4_x_183_cm%2C_National_Gallery_of_Art.jpg/800px-Albert_Gleizes%2C_1912-13%2C_Les_Joueurs_de_football_%28Football_Players%29%2C_oil_on_canvas%2C_225.4_x_183_cm%2C_National_Gallery_of_Art.jpg')
football_players_art = Art.new(
  artist: "Albert Gleizes",
  description: "Les Joueurs de football, also referred to as Football Players, is a 1912–13 painting by the French artist, theorist and writer Albert Gleizes. The work was exhibited at the Salon des Indépendants, Paris, March–May 1913 (no. 1293). September through December 1913 the painting was exhibited at Erster Deutscher Herbstsalon, Berlin (no. 147). The work was featured at Galeries Dalmau in Barcelona, 29 November – 12 December 1916 (no. 31), Gleizes' first one-person show. The work was again exhibited at Galeries Dalmau 16 October – 6 November 1926 (no. 7). Stylistically Gleizes' Football Players exemplifies the principle of mobile perspective laid out in Du Cubisme, written by himself and French painter Jean Metzinger. Guillaume Apollinaire wrote about Les Joueurs de football in an article titled Le Salon des indépendants, published in L'Intransigeant, 18 March 1913, and again in A travers le Salon des indépendants, published in Montjoie!, Numéro Spécial, 18 March 1913.

Les Joueurs de football was left by the artist at Galeries Dalmau in 1916. Titled Jugadors de Futbol, the painting was reproduced in the avant-garde Catalan magazine L'Amic de les arts, November 1926. The caption included the inscription Collection Joseph Dalmau.

It was purchased from the Dalmau family between 1953 and 1955 by Stephen Hahn and (The Sidney Janis Gallery); sold in 1955 to Nelson Aldrich Rockefeller, New York. Subsequently the work was sold to the Marlborough-Gerson gallery, New York, and purchased May 1970 by the National Gallery of Art (NGA), Washington D.C.",
  title: "Football Players",
  price: 16.99,
  user_id: juergen.id
)
football_players_art.photo.attach(io: football_players, filename: 'football_players.jpg', content_type: 'image/jpg')
football_players_art.save!

puts "Created #{football_players_art.title}"

rideau = URI.open('https://upload.wikimedia.org/wikipedia/en/f/f9/Yellow_Curtain.jpg')
rideau_art = Art.new(
  artist: "Henri Matisse",
  description: "Le rideau jaune (The Yellow Curtain) is a painting by Henri Matisse created in 1915. Its size is 57½ × 38⅛ (146 × 97 cm). It is currently in the collection of the Museum of Modern Art, New York.

Matisse's original title for the painting, Composition, draws attention to its abstract quality. Interviewed in 1931, Matisse explained that the painting represents a view from a curtained window in his home at Issy-les-Moulineaux, including the blue glass canopy that covered the front door.

It was donated to them as a gift of Jo Carole and Ronald S. Lauder, Nelson Rockefeller Bequest, gift of Mr. and Mrs. William H. Weintraub, and Mary Sisler Bequest, all by exchange.",
  title: "Le rideau jaune",
  price: 5.99,
  user_id: juergen.id
)
rideau_art.photo.attach(io: rideau, filename: 'rideau.jpg', content_type: 'image/jpg')
rideau_art.save!

puts "Created #{rideau_art.title}"

doerte = User.new(
  email: "doerte@torx.de",
  password: "123456",
  first_name: "Dörte",
  last_name: "Torx"
)

doerte.save!
puts "Created User: #{doerte.first_name} #{doerte.last_name}..."

puts "Creating #{doerte.first_name}s art..."

stanczyk = URI.open('https://upload.wikimedia.org/wikipedia/commons/7/78/Jan_Matejko%2C_Sta%C5%84czyk.jpg')
stanczyk_art = Art.new(
  artist: "Jan Matejko",
  description: "Stańczyk (Polish: Stańczyk w czasie balu na dworze królowej Bony wobec straconego Smoleńska, English: Stańczyk during a ball at the court of Queen Bona in the face of the loss of Smolensk) is a painting by Jan Matejko finished in 1862. This painting was acquired by the Warsaw National Museum in 1924. During World War II it was looted by the Nazis and subsequently by the Soviet Union, but was returned to Poland around 1956.

It is one of Matejko's most famous works and the one that launched him to fame. It has been described as one of the most recognizable paintings in the Warsaw National Museum, and is a flagship painting for the 'Collection of Polish paintings prior to 1914'. Its primary component is the contrast between the solemn jester (the titular Stańczyk) and the lively ball going on in the background. The painting has created an image of Stańczyk that has become iconic and widely recognized in Poland.",
  title: "Stańczyk",
  price: 37.45,
  user_id: doerte.id
)
stanczyk_art.photo.attach(io: stanczyk, filename: 'stanczyk.jpg', content_type: 'image/jpg')
stanczyk_art.save!

puts "Created #{stanczyk_art.title}"

maria_sethe = URI.open('https://upload.wikimedia.org/wikipedia/commons/1/14/Kmska_Th%C3%A9o_Van_Rysselberghe_%281862-1926%29_-_Mevrouw_Henry_Van_de_Velde-S%C3%A8the_%281921%29_-_28-02-2010_13-11-02.jpg')
maria_sethe_art = Art.new(
  artist: "Théo van Rysselberghe",
  description: "Maria Sèthe at the Harmonium is an oil on canvas painting by the Belgian neo-impressionist painter Théo van Rysselberghe. The painting depicts a woman with blonde, worn-up hair and a purple dress staring dreamily into space, while smiling. The sitter was Maria Sèthe, who belonged to an affluent musical family with an interest in the arts. In the painting, she is depicted sitting at a harmonium, but she's not playing it.

The painting shows the influence of Seurat on van Rysselberghe, the latter's adoption of Seurat’s pointillism, and his rejection of Seurat’s style and simplification.",
  title: "Maria Sèthe at the Harmonium",
  price: 29.99,
  user_id: doerte.id
)
maria_sethe_art.photo.attach(io: maria_sethe, filename: 'maria_sethe.jpg', content_type: 'image/jpg')
maria_sethe_art.save!

puts "Created #{maria_sethe_art.title}"

sailboats = URI.open('https://upload.wikimedia.org/wikipedia/commons/6/60/Rijsselberghe%2C_Voiliers.jpg')
sailboats_art = Art.new(
  artist: "Théo van Rysselberghe",
  description: "Sailboats and Estuary (also The Entrance to the Port of Roscoff, French: L'entrée du port de Roscoff) is an oil on canvas painting by Belgian painter Théo van Rysselberghe. Painted around 1887, it shows a coastal landscape elaborated in a Pointillist technique. Van Rysselberghe probably adopted the Pointillist manner after befriending Signac; however, the use of color in Sailboats and Esuary is nonetheless far more realistic than in paintings by Signac and other Neo-Impressionists, and reveals a tendency towards naturalism. The artwork has been in the collection of the Musée d'Orsay in Paris since 1982, on loan from the Louvre.",
  title: "Sailboats and Estuary",
  price: 24.99,
  user_id: doerte.id
)
sailboats_art.photo.attach(io: sailboats, filename: 'sailboats.jpg', content_type: 'image/jpg')
sailboats_art.save!

puts "Created #{sailboats_art.title}"

jean_luc = User.new(
  email: "jean_luc@louvre.com",
  password: "123456",
  first_name: "Jean-Luc",
  last_name: "Martinez"
)

jean_luc.save!
puts "Created User: #{jean_luc.first_name} #{jean_luc.last_name}..."

puts "Creating #{jean_luc.first_name}s art..."

mona_lisa = URI.open('https://images.unsplash.com/photo-1423742774270-6884aac775fa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80')
mona_lisa_art = Art.new(
  artist: "Leonardo da Vinci",
  description: "The Mona Lisa is a half-length portrait painting by Italian artist Leonardo da Vinci. Considered an archetypal masterpiece of the Italian Renaissance, it has been described as 'the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world'. The painting's novel qualities include the subject's enigmatic expression, the monumentality of the composition, the subtle modelling of forms, and the atmospheric illusionism.

The painting is probably of the Italian noblewoman Lisa Gherardini, the wife of Francesco del Giocondo, and is in oil on a white Lombardy poplar panel. Leonardo never gave the painting to the Giocondo family, and later it is believed he left it in his will to his favored apprentice Salaì. It had been believed to have been painted between 1503 and 1506; however, Leonardo may have continued working on it as late as 1517. It was acquired by King Francis I of France and is now the property of the French Republic itself, on permanent display at the Louvre, Paris since 1797.

The Mona Lisa is one of the most valuable paintings in the world. It holds the Guinness World Record for the highest known insurance valuation in history at US$100 million in 1962 (equivalent to $660 million in 2019).",
  title: "Mona Lisa",
  price: 35.15,
  user_id: jean_luc.id
)
mona_lisa_art.photo.attach(io: mona_lisa, filename: 'mona_lisa.jpg', content_type: 'image/jpg')
mona_lisa_art.save!

puts "Created #{mona_lisa_art.title}"

hope = URI.open('https://upload.wikimedia.org/wikipedia/commons/e/eb/Assistants_and_George_Frederic_Watts_-_Hope_-_Google_Art_Project.jpg')
hope_art = Art.new(
  artist: "George Frederic Watts",
  description: "Hope is a Symbolist oil painting by the English painter George Frederic Watts, who completed the first two versions in 1886. Radically different from previous treatments of the subject, it shows a lone blindfolded female figure sitting on a globe, playing a lyre that has only a single string remaining. The background is almost blank, its only visible feature a single star. Watts intentionally used symbolism not traditionally associated with hope to make the painting's meaning ambiguous. While his use of colour in Hope was greatly admired, at the time of its exhibition many critics disliked the painting. Hope proved popular with the Aesthetic Movement, who considered beauty the primary purpose of art and were unconcerned by the ambiguity of its message. Reproductions in platinotype, and later cheap carbon prints, soon began to be sold.

Although Watts received many offers to buy the painting, he had agreed to donate his most important works to the nation and felt it would be inappropriate not to include Hope. Consequently, later in 1886 Watts and his assistant Cecil Schott painted a second version. On its completion Watts sold the original and donated the copy to the South Kensington Museum (now the Victoria and Albert Museum); thus, this second version is better known than the original. He painted at least two further versions for private sale.

As cheap reproductions of Hope, and from 1908 high-quality prints, began to circulate in large quantities, it became a widely popular image. President Theodore Roosevelt displayed a copy at his Sagamore Hill home in New York; reproductions circulated worldwide; and a 1922 film depicted Watts's creation of the painting and an imagined story behind it. By this time Hope was coming to seem outdated and sentimental, and Watts was rapidly falling out of fashion. In 1938 the Tate Gallery ceased to keep their collection of Watts's works on permanent display.

Despite the decline in Watts's popularity, Hope remained influential. Martin Luther King Jr. based a 1959 sermon, now known as Shattered Dreams, on the theme of the painting, as did Jeremiah Wright in Chicago in 1990. Among the congregation for the latter was the young Barack Obama, who was deeply moved. Obama took The Audacity of Hope as the theme of his 2004 Democratic National Convention keynote address, and as the title of his 2006 book; he based his successful 2008 presidential campaign around the theme of Hope.",
  title: "Hope",
  price: 14.99,
  user_id: jean_luc.id
)
hope_art.photo.attach(io: hope, filename: 'hope.jpg', content_type: 'image/jpg')
hope_art.save!

puts "Created #{hope_art.title}"


puts "Finished!"
