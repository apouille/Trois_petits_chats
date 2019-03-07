1.times do
	user = User.create!(
		email: "#{Faker::Name.first_name}@yopmail.com",
		password: "test1234"
	)
end

20.times do
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

1.times do
  cart = Cart.create!(
    status: 0,
    user: User.first,
    )
  puts 'cart created'
end

1.times do
  cart = Cart.create!(
    status: 1,
    user: User.first,
    )
  puts 'cart created'
end


3.times do
  cartitems = CartItem.create!(
    cart: Cart.first,
    item: Item.all.sample,
    quantity: 1
    )
end

3.times do
  cartitems = CartItem.create!(
    cart: Cart.last,
    item: Item.all.sample,
    quantity: 1
    )
end




