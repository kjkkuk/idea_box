# frozen_string_literal: true

# == Schema Information
#
# Table name: team_members
#
#  id         :bigint           not null, primary key
#  team_role  :integer          not null
#  teams_id   :bigint
#  users_id   :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TeamMember < ApplicationRecord
  belongs_to :team, foreign_key: :teams_id
  belongs_to :user, foreign_key: :users_id

  # validate :validate
  validates :team_role, presence: true

  enum team_role: Team::ROLES

  # def validate(record)
  #   if user_creator# == false
  #     # record.errors.add(:base, 'A person cannot be a robot') if person_is_robot
  #   end
  # end

  private

  # def user_creator
  #   a = object.team_member.where(user_id: current_user.id).first
  #   if matchup_user
  #     matchup_user.is_creator
  #   end
  # end
end
