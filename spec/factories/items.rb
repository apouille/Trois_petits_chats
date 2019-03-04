FactoryBot.define do
  factory :item do
    title { Faker::Creature::Cat.breed }
    description { Faker::Lorem.characters(41) }
    price { Faker::Number.decimal(2, 2) }
    image_url { "https://pasteboard.co/I3R1Cuk.jpg" }
    author { Faker::Name.name }
    dimension { "300x500"}
    view { rand(1..10) }
  end
end
