class Feedback < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  belongs_to :idea, foreign_key: "idea_id"
end
