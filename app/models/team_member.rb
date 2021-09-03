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
#  is_creator :boolean          not null
#
class TeamMember < ApplicationRecord
  has_paper_trail
  belongs_to :team, foreign_key: :teams_id, inverse_of: :team_members
  belongs_to :user, foreign_key: :users_id, inverse_of: :team_members

  validates :team_role, presence: true

  enum team_role: Team::ROLES
end
