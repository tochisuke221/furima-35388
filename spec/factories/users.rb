FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    c_last_name             { Faker::Name.initials(number: 2) }
    c_first_name            { Faker::Name.initials(number: 2) }
    j_last_name             { Faker::Name.initials(number: 2) }
    j_first_name            { Faker::Name.initials(number: 2) }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
