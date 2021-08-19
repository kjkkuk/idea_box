# frozen_string_literal: true

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

10.times do
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

TeamMember.create!(teams_id: Team.all.each(&:id),
                   users_id: User.all.each(&:id), team_role: Team::ROLES.sample,
                   is_creator: false)
