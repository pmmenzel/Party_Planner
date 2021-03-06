10.times do

  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password'
    )

  event = Event.create(
    name: Faker::Name.name,
    date: Faker::Date.forward(30),
    location: Faker::Address.street_address,
    public_party: [true, false].sample,
    user_id: user.id,
    )

end

User.create!(first_name: 'Patrick', last_name: 'Menzel', email: 'patrick@test.com', password: 'password')
