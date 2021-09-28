# frozen_string_literal: true

class SubscribeIdea < ApplicationRecord
  belongs_to :idea, foreign_key: :ideas_id, inverse_of: :subscribe_ideas
  belongs_to :user, foreign_key: :users_id, inverse_of: :subscribe_ideas
end
