10.times do

  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
    )

  guestlist = Guestlist.create(
    )

  event = Event.create(
    name: Faker::Name.name,
    date: Faker::Date.forward(30),
    location: Faker::Address.street_address,
    public_party: [true, false].sample,
    user_id: user.id,
    guestlist_id: guestlist.id
    )

  guestlist.event_id = event.id
  guestlist.save

end
