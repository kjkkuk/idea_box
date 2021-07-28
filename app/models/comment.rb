class Comment < ApplicationRecord
  # has_many :users
  # has_many :ideas
  belongs_to :user, foreign_key: "user_id"
  belongs_to :commentable, polymorphic: true

end
