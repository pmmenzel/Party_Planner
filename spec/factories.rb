FactoryGirl.define do

  factory :user do
    first_name    {Faker::Name.first_name}
    last_name     {Faker::Name.last_name}
    email         {Faker::Internet.email}
    password      'password'
    factory :users_with_events do
      after :create do |user|
        FactoryGirl.create :event, user: user
      end
    end
  end

  factory :event do
    name          "Party Time"
    date          { Faker::Date.forward(rand(30..90)) }
    location      { Faker::Address.street_address }
    public_party  [true, false].sample
  end

  items = %w(Drinks Food Plates)

  factory :item do
    association :event
    name        "#{items.sample}"
    quantity    1
  end
end