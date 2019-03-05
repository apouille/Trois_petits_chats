FactoryBot.define do
  factory :cart do
    stripe_customer_id { "MyString" }
    status { 1 }
  end
end
