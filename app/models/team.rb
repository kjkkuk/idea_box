# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :bigint           not null, primary key
#  team_name  :string(225)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Team < ApplicationRecord
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members, dependent: :destroy
  has_many :ideas, dependent: :destroy

  validates :team_name, presence: true, length: { maximum: 50 }
end
