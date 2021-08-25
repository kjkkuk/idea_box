# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.transaction do
  Role.find_or_create_by(role: :admin)
  Role.find_or_create_by(role: :user)

  10.times do
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

  not_exist_team = Team.all.ids - TeamMember.distinct.pluck(:teams_id)
  not_exist_team.each do |id|
    TeamMember.create!([{ teams_id: id,
                          users_id: User.all.ids.sample,
                          team_role: 0,
                          is_creator: true }])
  end

  Team.all.each do |team|
    roles_of_team = team.team_members.pluck(:team_role).map(&:to_sym)
    roles_exist = Team::ROLES - roles_of_team
    next unless roles_exist != Team::ROLES
    roles_exist.each do |role|
      TeamMember.create!(team_role: role,
                         teams_id: team.id,
                         users_id: User.all.ids.sample,
                         is_creator: false)
    end
  end
end
