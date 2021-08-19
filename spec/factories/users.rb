# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::FunnyName.name.split.first }
    last_name { Faker::FunnyName.name.split.last }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { create(:role, role: 'user') }
  end
end
