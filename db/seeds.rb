require 'faker'

10.times do
   item = Item.create!(title: Faker::Creature::Cat.breed, description: Faker::Lorem.paragraph, price: Faker::Number.decimal(2, 2), image_url: "https://pasteboard.co/I3R1Cuk.jpg")
end