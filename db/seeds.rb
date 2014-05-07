# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = User.create ([
  
#   ])

events = Event.create ([
  {name: 'Birthday', event_date: 20140520 },
  {name: 'Happy Hour', event_date: 20140604},
  {name: '50th Anniversary', event_date: 20140515}

  ])

photos = Photo.create ([
  {name: 'image1', event_id: 2},
  {name: 'image2', event_id: 3},
  {name: 'image3', event_id: 1},
  {name: 'image3', event_id: 1},
  {name: 'image3', event_id: 2},
  {name: 'image3', event_id: 2}
  
  ])


