# frozen_string_literal: true

require 'faker'

ActiveRecord::Base.transaction do
  if ENV['CLEAR_SEEDS']
    Idea.delete_all
    TeamMember.delete_all
    Team.delete_all
    User.delete_all
    Role.delete_all
  end

  Role.find_or_create_by(role: :admin)
  Role.find_or_create_by(role: :user)

  3.times do
    Team.find_or_create_by(team_name: Faker::Team.name)
  end

  User.create!(first_name: 'Dima',
               last_name: 'Yakutovich',
               email: 'kjk.kuk@mail.ru',
               sponsor_id: nil,
               password: '1234567',
               password_confirmation: '1234567')

  3.times do
    first_name = Faker::FunnyName.name.split.first
    last_name = Faker::FunnyName.name.split.last
    email = Faker::Internet.email
    password = '1234567'
    User.create!(first_name: first_name,
                 last_name: last_name,
                 email: email,
                 sponsor_id: nil,
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
    3.times do
      Idea.create!(idea_name: Faker::Music.band,
                   idea_description: Faker::Movies::Lebowski.quote,
                   need: Idea::NEED.sample,
                   geo: Idea::GEO.sample,
                   problem: Faker::Games::Dota.quote,
                   industry: Idea::INDUSTRY.sample,
                   visible: true,
                   team: team,
                   user: User.all.sample)
    end
  end

  User.all.each do |user|
    Idea.all.each do |idea|
      Feedback.create!(reaction: Feedback::REACTION.sample,
                       users_id: user.id,
                       ideas_id: idea.id,
                       rating: rand(1..5))
    end
  end
end
