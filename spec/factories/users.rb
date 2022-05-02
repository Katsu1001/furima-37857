FactoryBot.define do
  factory :user do
    nickname              {'katsu'}
    email                 {Faker::Internet.free_email}
    password              {'katsu10'}
    password_confirmation {'katsu10'}
    family_name           {'倉橋'}
    first_name            {'克海'}
    family_name_katakana  {'クラハシ'}
    first_name_katakana   {'カツミ'}
    birthday              {'1999-10-1'}
  end
end