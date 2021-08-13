# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Role.find_or_create_by(role: :admin)
Role.find_or_create_by(role: :user)

30.times do
  Team.find_or_create_by(team_name: Faker::Team.name)
end

User.create!(first_name: 'Dima',
             last_name: 'Yakutovich',
             email: 'kjk.kuk@mail.ru',
             password: '1234567',
             password_confirmation: '1234567')

99.times do
  first_name = Faker::FunnyName.name.split.first
  last_name = Faker::FunnyName.name.split.last
  email = Faker::Internet.email
  password = '1234567'
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password: password,
               password_confirmation: password)
end

TeamMember.create!(team_id: 1, user_id: 2, team_role: 2)
