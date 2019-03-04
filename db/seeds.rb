
require 'faker'

10.times do
   item = Item.create!(title: Faker::Creature::Cat.breed, description: Faker::Lorem.paragraph, price: Faker::Number.decimal(2, 2), image_url: "http://placekitten.com/500/300")
end

10.times do
 profile = Profile.create!(
 	first_name: Faker::Name.first_name,
 	last_name: Faker::Name.last_name,
 	street: Faker::Address.street_address,
 	city: Faker::Address.city,
 	zip_code: "#{rand(10000..99999)}",
 	phone_number: "0033#{rand(100000000..999999999)}"
 	)
end

