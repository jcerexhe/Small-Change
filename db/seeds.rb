# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create(email: 'hendersonsam456@gmail.com' , password: '12345678', first_name: 'Sam ', last_name: "Henderson", admin: 'true')

charity1 = Charity.create(name: 'Greenpeace', logo:'http://res.cloudinary.com/small-change/image/upload/v1456287080/greenpeace_logo-compressor_jm3ehh.png', bsb: '1234563', account_number: '123456', contact_name: "Peter Smith", contact_email:"peter@gmail.com", url:'http://www.greenpeace.org/australia/en/', blurb: 'Greenpeace states its goal is to "ensure the ability of the Earth to nurture life in all its diversity and focuses its campaigning on worldwide issues such as climate change, deforestation, overfishing, commercial whaling, genetic engineering, and anti-nuclear issues. It uses direct action, lobbying, and research to achieve its goals.')

charity2 = Charity.create(name: 'GetUp!', logo:'https://www.getup.org.au/assets/public/getup_logo-80e6b538167941e6c28fa3b2ef35b84a.png', bsb: '12345763', account_number: '1234756', contact_name: "Peter Bryan", contact_email:"bryan@gmail.com", url:'https://www.getup.org.au/', blurb: "GetUp is one of Australia's largest campaigning communities, with a membership of over 1,000,000 people. We're an independent, grassroots, community advocacy organisation that seeks to build a more progressive Australia and hold politicians to account. Whether it is campaigning on climate action, economic fairness, environmental sustainability or issues of social justice, GetUp members combine to demand better from our government, big business and media.")