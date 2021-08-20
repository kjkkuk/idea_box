# frozen_string_literal: true

require 'faker'

# Role.find_or_create_by(role: :admin)
# Role.find_or_create_by(role: :user)
#
# 15.times do
#   Team.find_or_create_by(team_name: Faker::Team.name)
# end
#
# User.create!(first_name: 'Dima',
#              last_name: 'Yakutovich',
#              email: 'kjk.kuk@mail.ru',
#              password: '1234567',
#              password_confirmation: '1234567')
#
# 10.times do
#   first_name = Faker::FunnyName.name.split.first
#   last_name = Faker::FunnyName.name.split.last
#   email = Faker::Internet.email
#   password = '1234567'
#   User.create!(first_name: first_name,
#                last_name: last_name,
#                email: email,
#                password: password,
#                password_confirmation: password)
# end

# 10.times do
#   p team = TeamMember.where(is_creator: true)[teams_id:]
# # p TeamMember.where().create!(teams_id: team,
# #                                              users_id: !User.exists?,
# #                                              team_role: )
# end
TeamMember.create!([
                     { teams_id: 16, users_id: 2, team_role: 1, is_creator: false },
                     { teams_id: 16, users_id: 3, team_role: 3, is_creator: false },
                     { teams_id: 17, users_id: 4, team_role: 1, is_creator: false },
                     { teams_id: 17, users_id: 5, team_role: 2, is_creator: false },
                     { teams_id: 17, users_id: 6, team_role: 3, is_creator: false },
                     { teams_id: 18, users_id: 7, team_role: 1, is_creator: false },
                     { teams_id: 18, users_id: 8, team_role: 2, is_creator: false },
                     { teams_id: 18, users_id: 9, team_role: 3, is_creator: false },
                     { teams_id: 22, users_id: 10, team_role: 1, is_creator: false },
                     { teams_id: 22, users_id: 11, team_role: 2, is_creator: false },
                     { teams_id: 22, users_id: 2, team_role: 3, is_creator: false }
                   ])

# TeamMember.create!(teams_id)

# p User.all.each(&:id)
# p Team::ROLES.index.sample
# TeamMember.create!(teams_id: Team.all.each(&:id),
#                    users_id: User.all.each(&:id), team_role: index(Team::ROLES).sample,
#                    is_creator: false)
