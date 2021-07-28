class TeamMember < ApplicationRecord
  belongs_to :team, foreign_key: "team_id"
  belongs_to :user, foreign_key: "user_id"
end
