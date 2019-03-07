1.times do
	user = User.create!(
		email: "#{Faker::Name.first_name}@yopmail.com",
		password: "test1234"
	)
end

1.times do
 	profile = Profile.create!(
 		first_name: Faker::Name.first_name,
 		last_name: Faker::Name.last_name,
 		street: Faker::Address.street_address,
 		city: Faker::Address.city,
 		zip_code: "75000",
 		phone_number: "0033#{rand(100000000..999999999)}",
 		user: User.all.sample
 	)
end
