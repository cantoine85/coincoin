# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Clean db
Booking.destroy_all
Room.destroy_all
Place.destroy_all
Manager.destroy_all
Client.destroy_all

# Create manager
manager = Manager.new(name:"Claire Antoine")
puts "manager #{manager.name} was created" if manager.save

# Create place
la_ferme = Place.new(name:"La ferme des animaux")
la_ferme.manager = manager
puts "Place #{la_ferme.name} was created" if la_ferme.save

# Create rooms
rooms = [
  "La basse cour",
  "L'écurie",
  "L'enclos de Marguerite",
  "La niche de Médor",
  "La salle de chasse"
]

rooms.each do |room|
  r = Room.new(name: room)
  r.place = la_ferme
  puts "Room #{r.name} was created" if r.save
end

# Create client

clients = [
  {name: "Limagrain"},
  {name: "Michelin"},
  {name: "Le Bivouac"}
]

clients.each do |client|
  c = Client.new(client)
  puts "Client #{c.name} was created" if c.save
end

# Create bookings
bookings = [
  {
    client: { name: "Limagrain"},
    room: { name: "La basse cour"},
    start_time: DateTime.new(2017, 4, 7, 10),
    end_time: DateTime.new(2017, 4, 7, 13)
  },
  {
    client: { name: "Michelin"},
    room: { name: "La basse cour"},
    start_time: DateTime.new(2017, 4, 7, 15),
    end_time: DateTime.new(2017, 4, 7, 17)
  },

  {
    client: { name: "Michelin"},
    room: { name: "L'écurie"},
    start_time: DateTime.new(2017, 4, 7, 15),
    end_time: DateTime.new(2017, 4, 7, 17)
  },
  {
    client: { name: "Le Bivouac"},
    room: { name: "L'écurie"},
    start_time: DateTime.new(2017, 4, 8, 15),
    end_time: DateTime.new(2017, 4, 8, 17)
  },

]

bookings.each do |booking|
  b = Booking.new()
  b.client = Client.find_by(booking[:client])
  b.room = Room.find_by(booking[:room])
  b.start_time = booking[:start_time]
  b.end_time = booking[:end_time]
  puts "#{b.client.name} booked #{b.room.name} from #{b.start_time} to #{b.end_time}" if b.save
end


