FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '123abc' }
    password_confirmation { password }
    family_name           { 'テスト' }
    first_name            { '太郎' }
    kana_family_name      { 'テスト' }
    kana_first_name       { 'タロウ' }
    birthday              { '1930-01-01' }
  end
end
