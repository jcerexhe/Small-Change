# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(email: 'hendersonsam456@gmail.com' , password: '12345678', name: 'Sam Henderson', admin: 'true')

charity1 = Charity.create(id: 1, name: 'Greenpeace', logo:'http://res.cloudinary.com/small-change/image/upload/v1456287080/greenpeace_logo-compressor_jm3ehh.png', bsb: '1234563', account_number: '123456', contact_name: "Peter Smith", contact_email:"peter@gmail.com", url:'http://www.greenpeace.org/australia/en/', blurb: 'Greenpeace states its goal is to "ensure the ability of the Earth to nurture life in all its diversity and focuses its campaigning on worldwide issues such as climate change, deforestation, overfishing, commercial whaling, genetic engineering, and anti-nuclear issues. It uses direct action, lobbying, and research to achieve its goals.' )