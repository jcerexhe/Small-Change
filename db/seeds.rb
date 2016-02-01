# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(email: 'hendersonsam456@gmail.com' , password: '12345678', name: 'Sam Henderson', admin: 'true')

charity1 = Charity.create(id: 1, name: 'Greenpeace', logo:'https://animationbegins.files.wordpress.com/2012/12/greenpeace-logo.jpg', bsb: '1234563', account: 
  '123456', contact_name: "Peter Smith", contact_email:"peter@gmail.com" )