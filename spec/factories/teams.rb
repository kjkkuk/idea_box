# frozen_string_literal: true

FactoryBot.define do
  factory :team do
    team_name { Faker::FunnyName.name }
  end
end
