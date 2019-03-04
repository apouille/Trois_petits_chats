10.times do
	user = User.create!(
		email: "#{Faker::Name.first_name}@yopmail.com",
		password: "test1234"
	)
end

10.times do
   item = Item.create!(
   	title: Faker::Creature::Cat.breed,
   	author: Faker::Name.name,
   	dimension: "300x500",
   	price: Faker::Number.decimal(2, 2),
   	image_url: "http://placekitten.com/500/300",
  	description: Faker::Lorem.characters(41),
    view: rand(0..10)
  )
end

i = 1
10.times do
 	profile = Profile.create!(
 		first_name: Faker::Name.first_name,
 		last_name: Faker::Name.last_name,
 		street: Faker::Address.street_address,
 		city: Faker::Address.city,
 		zip_code: "75000",
 		phone_number: "0033#{rand(100000000..999999999)}",
 		user: User.find(i)
 	)
  i += 1
end
