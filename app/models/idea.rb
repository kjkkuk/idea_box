class Idea < ApplicationRecord
  has_many :comments
  belongs_to :user, foreign_key: "user_id"
  belongs_to :team, foreign_key: "team_id"

  has_many :comments, as: :commentable

end
