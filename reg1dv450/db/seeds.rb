# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Create some users
users = User.create([{ name: 'Admin',   email: "admin@admin.com",   password:"0000",    admin: true  },
                     { name: 'sven',    email: "sven@sven.com",     password:"1234",    admin: false },
                     { name: 'svennis', email: "svenne@sven.com",   password:"1234",    admin: false },
                     { name: 'kenny',   email: "kenny@sven.com",    password:"1234",    admin: false }, 
                     { name: 'leffe',   email: "leffe@sven.com",    password:"1234",    admin: false } ])

#Add some apps to users
u1 = User.find(1).applications << Application.create(name: "My Cool App")
u2 = User.find(2).applications << Application.create(name: "Another app")
u3 = User.find(3).applications << Application.create(name: "Third app")
u4 = User.find(4).applications << Application.create(name: "Final app")

# Create some venues
# Random generated positons w. kalmar as startpoint, generated from http://www.geomidpoint.com/random/
venues = Venue.create( [ {  venueName: "Metal meet",    longitude: 35.9148264,    latitude: 65.41206985,   
                            adress: "fakestreet 123"},
                         {  venueName: "Metulz fest",   longitude: 13.99153741,   latitude: 64.13994915,
                            adress: "fake road 123"},
                         {  venueName: "Metal meet",    longitude: 35.9148264,    latitude: 65.41206985,
                            adress: "fake boulevard 123"},
                         {  venueName: "Metal meet",     longitude: 35.9148264,   latitude: 65.41206985,
                            adress: "fake lane 123"} ])
#Create some artists
artists = Artist.create([ { name: "Sabaton" },      { name: "Raubtier" },   { name: "Ensiferum" },
                          { name: "Korpiklaani" },  { name: "Finntroll" },  { name: "Moonsorrow" },
                          { name: "Amon Amarth" },  { name: "Satyricon" },  { name: "Bloodbath" },
                          { name: "Watain" },       { name: "Hypocrisy" },  { name: "Wolf" },
                          { name: "Candlemass" },   { name: "Opeth" },      { name: "Kataklysm" } ])

#Create some creators
creator1 = Creator.create(user: User.find(1))                          
creator2 = Creator.create(user: User.find(2))   
creator3 = Creator.create(user: User.find(3))   
creator4 = Creator.create(user: User.find(4))   

#Create some shows
sh = Show.create()
sh.creator = creator1
sh.venue = Venue.find(1)
sh.artists << [Artist.find(1),Artist.find(2),Artist.find(3), Artist.find(4)]
=begin
sh2 = Show.create()
sh2.creator = creator2
sh2.venue = Venue.find(2)
sh2.artists << [Artist.find(5),Artist.find(6),Artist.find(7), Artist.find(8)]

sh3 = Show.create()
sh3.creator = creator3
sh3.venue = Venue.find(3)
sh3.artists << [Artist.find(9),Artist.find(10),Artist.find(11), Artist.find(12)]

sh2 = Show.create()
sh2.creator = creator4
sh2.venue = Venue.find(4)
sh2.artists << [Artist.find(13),Artist.find(14),Artist.find(15)]
=end