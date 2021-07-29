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
  belongs_to :team
  belongs_to :user

  validates :role, presence: true
end
