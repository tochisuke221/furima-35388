FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { "111qwe" }
    password_confirmation   { password }
    c_last_name             { Gimei.last.kanji }
    c_first_name            { Gimei.first.kanji }
    j_last_name             { Gimei.last.katakana }
    j_first_name            { Gimei.last.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
