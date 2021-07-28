class User < ApplicationRecord
  belongs_to :role, foreign_key: "role_id"

  has_many :team_members
  has_many :teams, through: :team_members

  has_many :ideas

  has_many :feedbacks
  #####
  has_many :comments, as: :commentable
end
