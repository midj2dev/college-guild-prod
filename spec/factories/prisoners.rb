FactoryGirl.define do
  factory :prisoner do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    address_1 Faker::Address.street_address
    state Faker::Address.state_abbr
    city Faker::Address.city
    zip Faker::Address.zip
    prison_id Faker::Number.number(8)
    enrollment_date Faker::Date.backward(100)
    comments Faker::Lorem.sentence
  end
end
