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


###################################### API ######################################

#Create some creators
creators = Creator.create( [ { name: 'Admin',   email: "admin@admin.com",   password:"0000",    admin: true  },
                             { name: 'sven',    email: "sven@sven.com",     password:"1234",    admin: false },
                             { name: 'svennis', email: "svenne@sven.com",   password:"1234",    admin: false },
                             { name: 'kenny',   email: "kenny@sven.com",    password:"1234",    admin: false }, 
                             { name: 'leffe',   email: "leffe@sven.com",    password:"1234",    admin: false } ] )

# Create some venues
# Random generated positons w. kalmar as startpoint, generated from http://www.geomidpoint.com/random/
venues = Venue.create( [ {  venueName: "Harrys Hardrock Shack",     longitude: 35.9148264,    latitude: 65.41206985,   
                            adress: "fakestreet 123"},
                         {  venueName: "Club Metulz",               longitude: 13.99153741,   latitude: 64.13994915,
                            adress: "fake road 132"},
                         {  venueName: "The Arena",                 longitude: 35.9148264,    latitude: 65.41206985,
                            adress: "Fake boulevard 231"},
                         {  venueName: "The Hub",                   longitude: 35.9148264,   latitude: 65.41206985,
                            adress: "fake lane 213"} ])
#Create some shows
sh  = Show.create(name: "Metalpalooza", description: "METULZ")    
sh2 = Show.create(name: "Rock Rumble",  description: "Another fake event")
sh3 = Show.create(name: "Brootal Fest", description: "Another fake event")
sh4 = Show.create(name: "Kvlt Fest",    description: "Another fake event")


#Create some artists
artists = Artist.create([ { name: "Sabaton" },      { name: "Raubtier" },   { name: "Ensiferum" },
                          { name: "Korpiklaani" },  { name: "Finntroll" },  { name: "Moonsorrow" },
                          { name: "Amon Amarth" },  { name: "Satyricon" },  { name: "Bloodbath" },
                          { name: "Watain" },       { name: "Hypocrisy" },  { name: "Wolf" },
                          { name: "Candlemass" },   { name: "Opeth" },      { name: "Kataklysm" } ])


#Add some artist to the shows
sh.artists  << [ artists[0],    artists[1],     artists[2],     artists[3]  ]
sh2.artists << [ artists[4],    artists[5],     artists[6],     artists[7]  ]
sh3.artists << [ artists[8],    artists[9],     artists[10],    artists[11] ]
sh4.artists << [ artists[12],   artists[13],    artists[14]                 ]


#Bind show to venue
venues[0].shows << sh
venues[1].shows << sh2
venues[2].shows << sh3
venues[3].shows << sh4

#Bind show to creator
creators[0].shows  << sh
creators[1].shows << sh2
creators[2].shows << sh3
creators[3].shows << sh4
